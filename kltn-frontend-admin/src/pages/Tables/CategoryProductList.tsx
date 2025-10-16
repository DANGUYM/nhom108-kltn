
import { useEffect, useState, useCallback } from "react";
import { toast } from "sonner";
import { getRootCategories, getSubCategories } from "@/services/categoryService";
import { filterProducts } from "@/services/productService";
import { getProductVariantsByProductId } from "@/services/productVariantService";
import { Product, ProductVariant } from "@/types/product";
import { CategoryResponse } from "@/types/responses/categoryResponse";
import PageBreadcrumb from "@/components/common/PageBreadCrumb";
import PageMeta from "@/components/common/PageMeta";
import FilterDropdown from "@/components/common/FilterDropdown";

// Mock Data & Sort Options
const mockColors = [
    { id: 1, name: 'Đỏ' }, { id: 2, name: 'Xanh dương' }, { id: 3, name: 'Xanh lá' },
    { id: 4, name: 'Đen' }, { id: 5, name: 'Trắng' }, { id: 6, name: 'Xám' },
    { id: 7, name: 'Hồng' }, { id: 8, name: 'Vàng' }, { id: 9, name: 'Nâu' },
    { id: 10, name: 'Tím' }, { id: 11, name: 'Cam' }, { id: 12, name: 'Be' },
    { id: 13, name: 'Xanh navy' }, { id: 14, name: 'Xanh mint' }, { id: 15, name: 'Hồng pastel' }
];

const mockSizes = [
    { id: 1, name: 'XS' }, { id: 2, name: 'S' }, { id: 3, name: 'M' },
    { id: 4, name: 'L' }, { id: 5, name: 'XL' }, { id: 6, name: 'XXL' },
    { id: 7, name: 'XXXL' }, { id: 8, name: 'Free Size' }, { id: 9, name: '38' },
    { id: 10, name: '39' }, { id: 11, name: '40' }, { id: 12, name: '41' },
    { id: 13, name: '42' }, { id: 14, name: '43' }, { id: 15, name: '44' }
];

const mockBrands = [
    { id: 1, name: 'Nike' }, { id: 2, name: 'Adidas' }, { id: 3, name: 'Puma' },
    { id: 4, name: 'Zara' }, { id: 5, name: 'H&M' }, { id: 6, name: 'Uniqlo' },
    { id: 7, name: 'Coolmate' }, { id: 8, name: 'Yame' }, { id: 9, name: 'Calvin Klein' },
    { id: 10, name: 'Tommy Hilfiger' }, { id: 11, name: 'Polo Ralph Lauren' },
    { id: 12, name: 'Lacoste' }, { id: 13, name: 'Converse' }, { id: 14, name: 'Vans' },
    { id: 15, name: 'Local Brand' }
];

const sortOptions = [
    { label: "Mới nhất", value: "createdAt,DESC" },
    { label: "Cũ nhất", value: "createdAt,ASC" },

    { label: "Bán chạy nhất", value: "orderCount,DESC" },
    { label: "Bán ít nhất", value: "orderCount,ASC" },

    { label: "Đánh giá cao nhất", value: "averageRating,DESC" },
    { label: "Đánh giá thấp nhất", value: "averageRating,ASC" },

    { label: "Giá: Thấp đến cao", value: "discountedPrice,ASC" },
    { label: "Giá: Cao đến thấp", value: "discountedPrice,DESC" },

    { label: "Lượt yêu thích", value: "favoriteCount,DESC" },
    { label: "Lượt yêu thích ít nhất", value: "favoriteCount,ASC" },

    { label: "Đánh giá nhiều nhất", value: "reviewCount,DESC" },
    { label: "Đánh giá ít nhất", value: "reviewCount,ASC" },

    { label: "Giảm giá nhiều nhất", value: "currentDiscountPercent,DESC" },
    { label: "Giảm giá ít nhất", value: "currentDiscountPercent,ASC" },
];

const ProductFilterAndTable: React.FC = () => {
    const [products, setProducts] = useState<Product[]>([]);
    const [isLoading, setIsLoading] = useState<boolean>(true);
    const [page, setPage] = useState(0);
    const [totalPages, setTotalPages] = useState(0);

    // Filter states
    const [rootCategories, setRootCategories] = useState<CategoryResponse[]>([]);
    const [subCategories, setSubCategories] = useState<CategoryResponse[]>([]);
    const [selectedRootCatId, setSelectedRootCatId] = useState<number | ''>('');
    const [selectedSubCatId, setSelectedSubCatId] = useState<number | ''>('');
    const [selectedColorIds, setSelectedColorIds] = useState<number[]>([]);
    const [selectedSizeIds, setSelectedSizeIds] = useState<number[]>([]);
    const [selectedBrandIds, setSelectedBrandIds] = useState<number[]>([]);
    const [minPrice, setMinPrice] = useState<number | undefined>();
    const [maxPrice, setMaxPrice] = useState<number | undefined>();
    const [tempMinPrice, setTempMinPrice] = useState('');
    const [tempMaxPrice, setTempMaxPrice] = useState('');
    const [sortOption, setSortOption] = useState<string>(sortOptions[0].value);

    // Table expansion states
    const [expandedRows, setExpandedRows] = useState<Record<number, boolean>>({});
    const [variantData, setVariantData] = useState<Record<number, ProductVariant[]>>({});
    const [variantLoading, setVariantLoading] = useState<Record<number, boolean>>({});

    // Fetch root categories on mount
    useEffect(() => {
        getRootCategories().then(setRootCategories).catch(() => toast.error("Failed to fetch root categories."));
    }, []);

    // Fetch sub-categories for the dropdown when a root category is selected
    useEffect(() => {
        if (selectedRootCatId) {
            getSubCategories(selectedRootCatId).then(setSubCategories).catch(() => toast.error("Failed to fetch sub-categories."));
        } else {
            setSubCategories([]);
        }
    }, [selectedRootCatId]);

    // Main data fetching logic
    useEffect(() => {
        const fetchFilteredProducts = async () => {
            setIsLoading(true);
            try {
                const [sortBy, sortDirection] = sortOption.split(',');
                const payload: any = { page, size: 10, sortBy, sortDirection };

                // --- Robust Category Filter Logic ---
                if (selectedSubCatId) {
                    payload.categoryIds = [selectedSubCatId];
                } else if (selectedRootCatId) {
                    // Fetch sub-categories directly to avoid race conditions
                    const subs = await getSubCategories(selectedRootCatId);
                    const subIds = subs.map(sc => sc.id);
                    // If root has sub-categories, use them. Otherwise, use the root ID itself.
                    payload.categoryIds = subIds.length > 0 ? subIds : [selectedRootCatId];
                }

                // Other filters
                if (selectedBrandIds.length > 0) payload.brandIds = selectedBrandIds;
                if (selectedColorIds.length > 0) payload.colorIds = selectedColorIds;
                if (selectedSizeIds.length > 0) payload.sizeIds = selectedSizeIds;
                if (minPrice !== undefined) payload.minPrice = minPrice;
                if (maxPrice !== undefined) payload.maxPrice = maxPrice;

                const response = await filterProducts(payload);
                setProducts(response.content);
                setTotalPages(response.totalPages);
            } catch (error) {
                toast.error("Failed to fetch products.");
            } finally {
                setIsLoading(false);
            }
        };

        fetchFilteredProducts();
    }, [page, selectedRootCatId, selectedSubCatId, selectedBrandIds, selectedColorIds, selectedSizeIds, minPrice, maxPrice, sortOption]);

    // Handlers
    const handleToggleRow = async (productId: number) => {
        const isExpanded = !!expandedRows[productId];
        setExpandedRows(prev => ({ ...prev, [productId]: !isExpanded }));
        if (!isExpanded && !variantData[productId]) {
            setVariantLoading(prev => ({ ...prev, [productId]: true }));
            try {
                const variants = await getProductVariantsByProductId(productId);
                setVariantData(prev => ({ ...prev, [productId]: variants }));
            } catch (error) {
                toast.error(`Failed to fetch variants for product ID ${productId}.`);
            } finally {
                setVariantLoading(prev => ({ ...prev, [productId]: false }));
            }
        }
    };

    const resetPage = () => setPage(0);

    const handleRootCategoryChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        setSelectedRootCatId(Number(e.target.value) || '');
        setSelectedSubCatId(''); // Atomically reset sub-category
        resetPage();
    };

    const handleBrandChange = (id: number, checked: boolean) => { setSelectedBrandIds(p => checked ? [...p, id] : p.filter(i => i !== id)); resetPage(); };
    const handleColorChange = (id: number, checked: boolean) => { setSelectedColorIds(p => checked ? [...p, id] : p.filter(i => i !== id)); resetPage(); };
    const handleSizeChange = (id: number, checked: boolean) => { setSelectedSizeIds(p => checked ? [...p, id] : p.filter(i => i !== id)); resetPage(); };
    const handleApplyPriceFilter = () => {
        const min = tempMinPrice ? parseFloat(tempMinPrice) : undefined;
        const max = tempMaxPrice ? parseFloat(tempMaxPrice) : undefined;
        if (min !== undefined && max !== undefined && min > max) {
            toast.error("Min price cannot be greater than max price.");
            return;
        }
        setMinPrice(min);
        setMaxPrice(max);
        resetPage();
    };

    return (
        <div>
            <PageMeta title="Product Management | Admin Dashboard" />
            <PageBreadcrumb pageTitle="Product & Variant Management" />

            {/* Filter Section */}
            <div className="mb-6 rounded-sm border border-stroke bg-white p-4 shadow-default dark:border-strokedark dark:bg-boxdark">
                <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
                    <select value={selectedRootCatId} onChange={handleRootCategoryChange} className="w-full rounded border p-2 dark:bg-form-input">
                        <option value="">All Root Categories</option>
                        {rootCategories.map(cat => <option key={cat.id} value={cat.id}>{cat.name}</option>)}
                    </select>
                    <select value={selectedSubCatId} onChange={e => {setSelectedSubCatId(Number(e.target.value) || ''); resetPage();}} disabled={!selectedRootCatId} className="w-full rounded border p-2 disabled:bg-gray-200 dark:bg-form-input">
                        <option value="">All Sub-Categories</option>
                        {subCategories.map(cat => <option key={cat.id} value={cat.id}>{cat.name}</option>)}
                    </select>

                    <div className="flex items-center gap-2">
                        <input type="number" placeholder="Min Price" value={tempMinPrice} onChange={e => setTempMinPrice(e.target.value)} className="w-full rounded border p-2 dark:bg-form-input" />
                        <span>-</span>
                        <input type="number" placeholder="Max Price" value={tempMaxPrice} onChange={e => setTempMaxPrice(e.target.value)} className="w-full rounded border p-2 dark:bg-form-input" />
                        <button onClick={handleApplyPriceFilter} className="rounded bg-primary px-4 py-2 text-white">Go</button>
                    </div>

                    <select value={sortOption} onChange={e => {setSortOption(e.target.value); resetPage();}} className="w-full rounded border p-2 dark:bg-form-input">
                        {sortOptions.map(opt => <option key={opt.value} value={opt.value}>{opt.label}</option>)}
                    </select>
                </div>
                <div className="mt-4 grid grid-cols-1 gap-4 sm:grid-cols-3">
                    <FilterDropdown title="Brands" options={mockBrands} selectedIds={selectedBrandIds} onSelectionChange={handleBrandChange} />
                    <FilterDropdown title="Colors" options={mockColors} selectedIds={selectedColorIds} onSelectionChange={handleColorChange} />
                    <FilterDropdown title="Sizes" options={mockSizes} selectedIds={selectedSizeIds} onSelectionChange={handleSizeChange} />
                </div>
            </div>

            {/* Table Section */}
            <div className="rounded-sm border border-stroke bg-white px-5 pt-6 pb-2.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
                <div className="max-w-full overflow-x-auto">
                    <table className="w-full table-auto">
                        <thead>
                        <tr className="bg-gray-2 text-left dark:bg-meta-4">
                            <th className="w-10 py-4 px-4 font-medium text-black dark:text-white"></th>
                            <th className="min-w-[220px] py-4 px-4 font-medium text-black dark:text-white">Product</th>
                            <th className="min-w-[150px] py-4 px-4 font-medium text-black dark:text-white">Brand</th>
                            <th className="min-w-[120px] py-4 px-4 font-medium text-black dark:text-white">Category</th>
                            <th className="py-4 px-4 font-medium text-black dark:text-white">Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        {isLoading ? (
                            <tr><td colSpan={5} className="text-center py-10">Loading products...</td></tr>
                        ) : products.length === 0 ? (
                            <tr><td colSpan={5} className="text-center py-10">No products found for the selected filters.</td></tr>
                        ) : (products.map(product => (
                            <>
                                <tr key={product.id}>
                                    <td className="border-b border-[#eee] py-5 px-4 dark:border-strokedark">
                                        <button onClick={() => handleToggleRow(product.id)} className="font-bold text-xl">
                                            {expandedRows[product.id] ? '-' : '+'}
                                        </button>
                                    </td>
                                    <td className="border-b border-[#eee] py-5 px-4 dark:border-strokedark">
                                        <p className="text-black dark:text-white">{product.name}</p>
                                    </td>
                                    <td className="border-b border-[#eee] py-5 px-4 dark:border-strokedark">
                                        <p className="text-black dark:text-white">{product.brand.name}</p>
                                    </td>
                                    <td className="border-b border-[#eee] py-5 px-4 dark:border-strokedark">
                                        <p className="text-black dark:text-white">{product.category.name}</p>
                                    </td>
                                    <td className="border-b border-[#eee] py-5 px-4 dark:border-strokedark">
                                        <p className={`inline-flex rounded-full bg-opacity-10 py-1 px-3 text-sm font-medium ${product.status === 'ACTIVE' ? 'bg-success text-success' : 'bg-danger text-danger'}`}>
                                            {product.status}
                                        </p>
                                    </td>
                                </tr>
                                {expandedRows[product.id] && (
                                    <tr>
                                        <td colSpan={5} className="p-4 bg-gray-100 dark:bg-boxdark-2">
                                            {variantLoading[product.id] ? <p>Loading variants...</p> :
                                                !variantData[product.id] || variantData[product.id].length === 0 ? <p>No variants found.</p> : (
                                                    <table className="w-full table-auto bg-white dark:bg-boxdark">
                                                        <thead className="bg-gray-200 dark:bg-meta-4">
                                                        <tr>
                                                            <th className="py-2 px-3 font-medium text-sm text-left">SKU</th>
                                                            <th className="py-2 px-3 font-medium text-sm text-left">Image</th>
                                                            <th className="py-2 px-3 font-medium text-sm text-left">Color</th>
                                                            <th className="py-2 px-3 font-medium text-sm text-left">Size</th>
                                                            <th className="py-2 px-3 font-medium text-sm text-left">Price</th>
                                                            <th className="py-2 px-3 font-medium text-sm text-left">Stock</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        {variantData[product.id].map(variant => (
                                                            <tr key={variant.id}>
                                                                <td className="border-t py-2 px-3 text-sm">{variant.sku}</td>
                                                                <td className="border-t py-2 px-3"><img src={variant.imageUrl} alt={variant.sku} className="h-12 w-12 object-cover"/></td>
                                                                <td className="border-t py-2 px-3 text-sm">{variant.color.name}</td>
                                                                <td className="border-t py-2 px-3 text-sm">{variant.size.name}</td>
                                                                <td className="border-t py-2 px-3 text-sm">{variant.price.toLocaleString()}đ</td>
                                                                <td className="border-t py-2 px-3 text-sm">{variant.stockQuantity}</td>
                                                            </tr>
                                                        ))}
                                                        </tbody>
                                                    </table>
                                                )}
                                        </td>
                                    </tr>
                                )}
                            </>
                        )))}
                        </tbody>
                    </table>
                </div>
                {/* Pagination */}
                <div className="flex justify-center mt-8 mb-4">
                    {Array.from({ length: totalPages }, (_, i) => (
                        <button
                            key={i}
                            onClick={() => setPage(i)}
                            className={`mx-1 px-3 py-1 rounded ${page === i ? 'bg-primary text-white' : 'bg-gray-200 dark:bg-meta-4'}`}
                        >
                            {i + 1}
                        </button>
                    ))}
                </div>
            </div>
        </div>
    );
};

export default ProductFilterAndTable;
