# DawaCare - Smart Pharmacy Management System

A pharmacy management dashboard built with semantic HTML, Tailwind CSS, vanilla JavaScript, Vite, and SQL schema files. The browser demo uses `localStorage` for persistence; SQL is provided in `database/schema.sql` for connecting a future backend.

## Run locally

1. Install Node.js 18 or newer from https://nodejs.org/
2. Open this folder in VS Code or a terminal.
3. Install dependencies:

```bash
npm install
```

4. Start the development server:

```bash
npm run dev
```

5. Create a production build:

```bash
npm run build
```

## Included workflows

- Dashboard with inventory KPIs, revenue chart, quick actions, recent sales, and alerts
- Medicine inventory with search, stock levels, pricing, expiry dates, and deletion
- Supplier directory with contact details and management
- Purchase order tracking
- Sales recording that automatically decreases stock
- Low-stock and expiry alert views
- Seeded demo data for an immediately useful first launch
- LocalStorage persistence for medicines, suppliers, sales, and purchases
- SQL tables for suppliers, medicines, sales, and purchase orders

## Architecture

- `index.html` contains the application shell and Tailwind CSS configuration.
- `src/app.js` renders the UI and handles navigation, forms, inventory updates, and browser persistence.
- `database/schema.sql` defines the relational database tables and starter suppliers.

The browser cannot connect directly to SQL safely. To use the SQL database in production, add a server API that validates requests and maps the JavaScript operations to the schema.

## Data reset

To restore the seeded demo data, open the browser developer tools and run:

```js
localStorage.clear(); location.reload();
```
