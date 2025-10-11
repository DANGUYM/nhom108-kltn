import {
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import { Toaster } from "sonner";
import { useEffect } from "react";
import { useAuthStore } from "./stores/useAuthStore";
import Reloading from "./components/skeletions/Reloading";
import { deleteRefreshTokenFromRedis } from "./services/useTokenService";
import { ScrollToTop } from "./components/common/ScrollToTop";
import AppLayout from "./layout/AppLayout";

// Auth Pages
import SignIn from "./pages/AuthPages/SignIn";
import SignUp from "./pages/AuthPages/SignUp";
import OtpVerification from "./pages/AuthPages/OtpVerification";
import ForgotPassword from "./pages/AuthPages/ForgotPassword";
import ResetPassword from "./pages/AuthPages/ResetPassword";
import LoginPage from './pages/LoginPage';
import RegisterPage from './pages/RegisterPage';
import RegisterMailPage from './pages/RegisterMailPage';
import RegisterSuccessPage from './pages/RegisterSuccessPage';
import ForgotPasswordPage from './pages/ForgotPasswordPage';
import ForgotPasswordSuccessPage from './pages/ForgotPasswordSuccessPage';
import ChangeForgotPasswordPage from './pages/ChangeForgotPasswordPage';

// Main Pages
import Home from './pages/Home';
import NotFound from './pages/NotFound';
import SearchPage from './pages/SearchPage';

// User Pages
import UserPage from './pages/UserPage';
import UserProfiles from "./pages/UserProfiles";
import EditUser from './pages/EditUser';
import ChangePassword from './pages/ChangePassword';
import AddressesPage from './pages/AddressesPage';
import NewAddress from './pages/NewAddress';
import EditAddress from './pages/EditAddress';
import NotAuthenticatedPage from './pages/NotAuthenticatedPage';

// Product & Category Pages
import Category from './pages/categories/Category';
import CategoryWithSupplier from './pages/categories/CategoryWithSupplier';
import Product from './pages/product/Product';

// Shopping Pages
import Cart from './pages/cart/Cart';
import OrderList from './pages/cart/OrderList';
import FavoritesPage from './pages/favorite/Favorite';
import VoucherPage from './pages/voucher/Voucher';

// Payment Pages
import Payment from './pages/payment/payment';
import VnpayReturn from './pages/payment/VnpayReturn';
import OrderSuccess from './pages/payment/OrderSuccess';

// Review Pages
import UserReviews from './pages/review/Review';

// Info Pages
import AboutPage from './pages/AboutPage';
import FAQ from './pages/FAQ';
import Help from './pages/Help';
import PrivacyPolicy from './pages/PrivacyPolicy';
import TermsOfService from './pages/TermsOfService';
import ShippingPolicy from './pages/ShippingPolicy';
import CategoryTest from './pages/CategoryTest';

export default function App() {
  const { checkAuth, authUser, isLoading } =
    useAuthStore();

  useEffect(() => {
      checkAuth();
  }, [checkAuth]);
  console.log("authUser in App.jsx: ", authUser);

  useEffect(() => {
    const handleUnload = async () => {
        await deleteRefreshTokenFromRedis();
    };

    window.addEventListener("beforeunload", handleUnload);

    return () => {
      window.removeEventListener("beforeunload", handleUnload);
      handleUnload();
    };
  }, []);
  
  if (isLoading) {
    return <Reloading />;
  }

  return (
    <>
      <Toaster />
      <ScrollToTop />
      <Routes>
        {/* Main Fashion E-commerce Layout */}
        <Route element={<AppLayout />}>
          {/* Home Page */}
          <Route index path="/" element={<Home />} />
          
          {/* Product & Category Pages */}
          <Route path="/category/:id" element={<Category />} />
          <Route path="/category/:id/supplier/:supplierId" element={<CategoryWithSupplier />} />
          <Route path="/product/:id" element={<Product />} />
          <Route path="/search" element={<SearchPage />} />

          {/* User Profile Pages - Require Authentication */}
          <Route path="/user" element={authUser ? <UserPage /> : <Navigate to="/signin" />} />
          <Route path="/user/profile" element={authUser ? <UserProfiles /> : <Navigate to="/signin" />} />
          <Route path="/user/edit" element={authUser ? <EditUser /> : <Navigate to="/signin" />} />
          <Route path="/user/change-password" element={authUser ? <ChangePassword /> : <Navigate to="/signin" />} />
          
          {/* Address Management */}
          <Route path="/user/addresses" element={authUser ? <AddressesPage /> : <Navigate to="/signin" />} />
          <Route path="/user/addresses/new" element={authUser ? <NewAddress /> : <Navigate to="/signin" />} />
          <Route path="/user/addresses/edit/:id" element={authUser ? <EditAddress /> : <Navigate to="/signin" />} />

          {/* Shopping Pages */}
          <Route path="/cart" element={<Cart />} />
          <Route path="/orders" element={authUser ? <OrderList /> : <Navigate to="/signin" />} />
          <Route path="/favorites" element={authUser ? <FavoritesPage /> : <Navigate to="/signin" />} />
          <Route path="/voucher" element={authUser ? <VoucherPage /> : <Navigate to="/signin" />} />

          {/* Payment Pages */}
          <Route path="/payment" element={authUser ? <Payment /> : <Navigate to="/signin" />} />
          <Route path="/payment/vnpay-return" element={<VnpayReturn />} />
          <Route path="/payment/success" element={<OrderSuccess />} />

          {/* Review Pages */}
          <Route path="/user/reviews" element={authUser ? <UserReviews /> : <Navigate to="/signin" />} />

          {/* Information Pages */}
          <Route path="/about" element={<AboutPage />} />
          <Route path="/faq" element={<FAQ />} />
          <Route path="/help" element={<Help />} />
          <Route path="/privacy-policy" element={<PrivacyPolicy />} />
          <Route path="/terms-of-service" element={<TermsOfService />} />
          <Route path="/shipping-policy" element={<ShippingPolicy />} />
          
          {/* Category API Test Route */}
          <Route path="/category-test" element={<CategoryTest />} />
        </Route>

        {/* Authentication Pages - No Layout */}
        <Route path="/signin" element={!authUser ? <SignIn /> : <Navigate to="/" />} />
        <Route path="/signup" element={!authUser ? <SignUp /> : <Navigate to="/" />} />
        <Route path="/login" element={!authUser ? <LoginPage /> : <Navigate to="/" />} />
        <Route path="/register" element={!authUser ? <RegisterPage /> : <Navigate to="/" />} />
        <Route path="/register-mail" element={!authUser ? <RegisterMailPage /> : <Navigate to="/" />} />
        <Route path="/register-success" element={<RegisterSuccessPage />} />
        <Route path="/otp-verification" element={!authUser ? <OtpVerification /> : <Navigate to="/" />} />
        <Route path="/forgot-password" element={!authUser ? <ForgotPassword /> : <Navigate to="/" />} />
        <Route path="/forgot-password-page" element={!authUser ? <ForgotPasswordPage /> : <Navigate to="/" />} />
        <Route path="/forgot-password-success" element={<ForgotPasswordSuccessPage />} />
        <Route path="/reset-password" element={!authUser ? <ResetPassword /> : <Navigate to="/" />} />
        <Route path="/change-forgot-password" element={<ChangeForgotPasswordPage />} />
        <Route path="/not-authenticated" element={<NotAuthenticatedPage />} />

        {/* Fallback Route */}
        <Route path="*" element={<NotFound />} />
      </Routes>
    </>
  );
}
