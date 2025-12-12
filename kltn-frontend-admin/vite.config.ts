// import { defineConfig } from "vite";
// import path from "path"
// import react from "@vitejs/plugin-react";
// import svgr from "vite-plugin-svgr";
//
// // https://vite.dev/config/
// export default defineConfig({
//   plugins: [
//     react(),
//     svgr({
//       svgrOptions: {
//         icon: true,
//         // This will transform your SVG to a React component
//         exportType: "named",
//         namedExport: "ReactComponent",
//       },
//     }),
//   ],
//   server: {
//     port: 8888
//   },
//    resolve: {
//     alias: {
//       "@": path.resolve(__dirname, "./src"),
//     },
//   },
//    define: {
//     global: 'window',
//   },
// });


import { defineConfig } from "vite";
import path from "path";
import react from "@vitejs/plugin-react";
import svgr from "vite-plugin-svgr";

export default defineConfig({
    base: "/",  // 🔥 Quan trọng cho deploy Vercel
    plugins: [
        react(),
        svgr({
            svgrOptions: {
                icon: true,
                exportType: "named",
                namedExport: "ReactComponent",
            },
        }),
    ],
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "./src"),
        },
    },
    server: {
        port: 8888,
    },
    define: {
        global: "window",
    },
});
