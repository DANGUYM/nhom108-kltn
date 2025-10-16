
import axiosInstance from "../lib/axios";
import { ProductVariant } from "@/types/product";

interface ApiErrorResponse {
    code: number;
    message: string;
    details?: any;
}

/**
 * Creates a new product variant.
 * @param formData - The product variant data, including the image file.
 * @returns Promise<ProductVariant>
 */
export const createProductVariant = async (formData: FormData): Promise<ProductVariant> => {
    try {
        const response = await axiosInstance.post<{ code: number; message: string; result: ProductVariant }>("/product-variants", formData, {
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        if (response.data.code === 201) { // 201 Created
            return response.data.result;
        } else {
            throw new Error(response.data.message || "Failed to create product variant");
        }
    } catch (error: any) {
        console.error("Error creating product variant:", error);

        if (error.response?.data) {
            const errorData = error.response.data as ApiErrorResponse;
            throw new Error(errorData.message || "Failed to create product variant");
        }

        throw new Error("Network error: Unable to create product variant");
    }
};

/**
 * Fetches all variants for a given product ID.
 * @param productId - The ID of the product.
 * @returns Promise<ProductVariant[]>
 */
export const getProductVariantsByProductId = async (productId: number): Promise<ProductVariant[]> => {
    try {
        const response = await axiosInstance.get<{ code: number; message: string; result: ProductVariant[] }>(`/product-variants/product/${productId}`);

        if (response.data.code === 200) {
            return response.data.result;
        } else {
            throw new Error(response.data.message || "Failed to fetch product variants");
        }
    } catch (error: any) {
        console.error(`Error fetching variants for product ${productId}:`, error);

        if (error.response?.data) {
            const errorData = error.response.data as ApiErrorResponse;
            throw new Error(errorData.message || "Failed to fetch product variants");
        }

        throw new Error("Network error: Unable to fetch product variants");
    }
};
