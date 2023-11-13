export default interface Product {
    id: number;
    name: string;
    price: number;
    thumbnail: string;
    description: string;
    created_at: string;
    updated_at: string;
    product_images: ProductImage[];
    category_id: number;
}

  