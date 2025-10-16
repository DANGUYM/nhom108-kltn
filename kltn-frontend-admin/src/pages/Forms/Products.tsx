
import { useState, useEffect } from 'react';
import PageBreadcrumb from "../../components/common/PageBreadCrumb";
import PageMeta from "../../components/common/PageMeta";
import { getCachedRootCategories, getSubCategories } from '../../services/categoryService';
import { createProduct } from '../../services/productService';
import { CategoryResponse } from '@/types/responses/categoryResponse';

const mockBrands = [
    { id: 1, name: 'Nike' }, { id: 2, name: 'Adidas' }, { id: 3, name: 'Puma' },
    { id: 4, name: 'Zara' }, { id: 5, name: 'H&M' }, { id: 6, name: 'Uniqlo' },
    { id: 7, name: 'Coolmate' }, { id: 8, name: 'Yame' }, { id: 9, name: 'Calvin Klein' },
    { id: 10, name: 'Tommy Hilfiger' }, { id: 11, name: 'Polo Ralph Lauren' },
    { id: 12, name: 'Lacoste' }, { id: 13, name: 'Converse' }, { id: 14, name: 'Vans' },
    { id: 15, name: 'Local Brand' }
];

export default function AddProductForm() {
  const [productName, setProductName] = useState('');
  const [description, setDescription] = useState('');
  const [basePrice, setBasePrice] = useState('');
  const [brandId, setBrandId] = useState<number | ''>('');
  const [images, setImages] = useState<File[]>([]);
  
  const [rootCategories, setRootCategories] = useState<CategoryResponse[]>([]);
  const [subCategories, setSubCategories] = useState<CategoryResponse[]>([]);
  const [selectedRootCategoryId, setSelectedRootCategoryId] = useState<number | ''>('');
  const [selectedSubCategoryId, setSelectedSubCategoryId] = useState<number | ''>('');

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  // Fetch root categories on component mount
  useEffect(() => {
    const fetchRootCategories = async () => {
      try {
        const roots = await getCachedRootCategories();
        setRootCategories(roots);
      } catch (err) {
        setError('Failed to fetch root categories.');
        console.error(err);
      }
    };
    fetchRootCategories();
  }, []);

  // Fetch sub-categories when a root category is selected
  useEffect(() => {
    const fetchSubCategories = async () => {
      if (selectedRootCategoryId) {
        try {
          setLoading(true);
          const subs = await getSubCategories(selectedRootCategoryId);
          setSubCategories(subs);
          setSelectedSubCategoryId(''); // Reset sub-category selection
        } catch (err) {
          setError('Failed to fetch sub-categories.');
          console.error(err);
        } finally {
          setLoading(false);
        }
      } else {
        setSubCategories([]); // Clear sub-categories if no root is selected
      }
    };
    fetchSubCategories();
  }, [selectedRootCategoryId]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!productName || !basePrice || !selectedSubCategoryId || !brandId || images.length === 0) {
      setError('Please fill in all required fields and upload at least one image.');
      return;
    }

    setLoading(true);
    setError(null);
    setSuccess(null);

    const formData = new FormData();
    formData.append('name', productName);
    formData.append('description', description);
    formData.append('basePrice', basePrice);
    formData.append('categoryId', String(selectedSubCategoryId)); // Send the sub-category ID
    formData.append('brandId', String(brandId));
    images.forEach(image => {
      formData.append('images', image);
    });

    try {
      await createProduct(formData);
      setSuccess('Product created successfully!');
      // Reset form
      setProductName('');
      setDescription('');
      setBasePrice('');
      setSelectedRootCategoryId('');
      setSelectedSubCategoryId('');
      setBrandId('');
      setImages([]);
    } catch (err: any) {
      setError(err.message || 'Failed to create product.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <PageMeta title="Add Product | Admin Dashboard" />
      <PageBreadcrumb pageTitle="Add New Product" />

      <div className="rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
        <div className="border-b border-stroke py-4 px-6.5 dark:border-strokedark">
          <h3 className="font-medium text-black dark:text-white">
            Product Information
          </h3>
        </div>
        <form onSubmit={handleSubmit} className="p-6.5">
          {error && <div className="mb-4 text-red-500">{error}</div>}
          {success && <div className="mb-4 text-green-500">{success}</div>}

          <div className="mb-4.5">
            <label className="mb-2.5 block text-black dark:text-white">
              Product Name <span className="text-meta-1">*</span>
            </label>
            <input
              type="text"
              value={productName}
              onChange={(e) => setProductName(e.target.value)}
              placeholder="Enter product name"
              className="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
              required
            />
          </div>

          <div className="mb-4.5">
            <label className="mb-2.5 block text-black dark:text-white">
              Base Price <span className="text-meta-1">*</span>
            </label>
            <input
              type="number"
              value={basePrice}
              onChange={(e) => setBasePrice(e.target.value)}
              placeholder="Enter base price"
              className="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
              required
            />
          </div>

          <div className="mb-4.5 flex flex-col gap-6 xl:flex-row">
            <div className="w-full xl:w-1/2">
              <label className="mb-2.5 block text-black dark:text-white">
                Root Category <span className="text-meta-1">*</span>
              </label>
              <select
                value={selectedRootCategoryId}
                onChange={(e) => setSelectedRootCategoryId(Number(e.target.value))}
                className="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
                required
              >
                <option value="">Select Root Category</option>
                {rootCategories.map(cat => (
                  <option key={cat.id} value={cat.id}>{cat.name}</option>
                ))}
              </select>
            </div>

            <div className="w-full xl:w-1/2">
              <label className="mb-2.5 block text-black dark:text-white">
                Sub Category <span className="text-meta-1">*</span>
              </label>
              <select
                value={selectedSubCategoryId}
                onChange={(e) => setSelectedSubCategoryId(Number(e.target.value))}
                className="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
                required
                disabled={!selectedRootCategoryId || subCategories.length === 0}
              >
                <option value="">Select Sub Category</option>
                {subCategories.map(cat => (
                  <option key={cat.id} value={cat.id}>{cat.name}</option>
                ))}
              </select>
            </div>
          </div>

          <div className="mb-4.5">
            <label className="mb-2.5 block text-black dark:text-white">
              Brand <span className="text-meta-1">*</span>
            </label>
            <select
              value={brandId}
              onChange={(e) => setBrandId(Number(e.target.value))}
              className="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
              required
            >
              <option value="">Select Brand</option>
              {mockBrands.map(brand => (
                <option key={brand.id} value={brand.id}>{brand.name}</option>
              ))}
            </select>
          </div>

          <div className="mb-6">
            <label className="mb-2.5 block text-black dark:text-white">
              Description
            </label>
            <textarea
              rows={4}
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder="Enter product description"
              className="w-full rounded border-[1.5px] border-stroke bg-transparent py-3 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary"
            ></textarea>
          </div>
          
          <div className="mb-6">
            <label className="mb-2.5 block text-black dark:text-white">
              Product Images <span className="text-meta-1">*</span>
            </label>
            <input
              type="file"
              multiple
              onChange={(e) => setImages(Array.from(e.target.files || []))}
              className="w-full rounded-md border border-stroke p-3 outline-none transition file:mr-4 file:rounded file:border-[0.5px] file:border-stroke file:bg-[#EEEEEE] file:py-1 file:px-2.5 file:text-sm file:font-medium focus:border-primary file:focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:file:border-strokedark dark:file:bg-white/30 dark:file:text-white"
            />
             <div>
                {images.map((file, index) => (
                  <div key={index}>{file.name}</div>
                ))}
            </div>
          </div>

          <button
            type="submit"
            className="flex w-full justify-center rounded bg-primary p-3 font-medium text-gray"
            disabled={loading}
          >
            {loading ? 'Creating...' : 'Create Product'}
          </button>
        </form>
      </div>
    </div>
  );
}
