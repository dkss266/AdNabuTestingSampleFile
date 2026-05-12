# AdNabuTestStore Automation

## Task 1: Test Cases

---

### A) Product Search Test Cases

**TC-S01 | Positive – Valid keyword returns results**
- Steps: Open store → Enter "shirt" in search → Submit
- Expected: Search results page displays at least one product matching "shirt"

**TC-S02 | Positive – Partial keyword returns results**
- Steps: Open store → Enter "sh" in search → Submit
- Expected: Results page shows products whose names contain "sh"

**TC-S03 | Negative – Non-existent keyword shows no results**
- Steps: Open store → Enter "xyzabc123" in search → Submit
- Expected: Page displays a "no results found" message; no products listed

**TC-S04 | Edge Case – Search with special characters**
- Steps: Open store → Enter "!@#$%" in search → Submit
- Expected: No crash; page either shows no results or handles gracefully with a user-friendly message

---

### B) Add to Cart Test Cases

**TC-C01 | Positive – Add a single product to cart**
- Steps: Search "shirt" → Click first result → Click "Add to Cart"
- Expected: Cart confirmation/notification appears; cart count increments by 1

**TC-C02 | Positive – Add multiple different products to cart**
- Steps: Add Product A → navigate back → Add Product B
- Expected: Cart shows both products; total count = 2

**TC-C03 | Negative – Attempt to add out-of-stock product**
- Steps: Navigate to a product marked "Sold Out" → Observe Add to Cart button
- Expected: "Add to Cart" button is disabled or absent; user cannot add the item

**TC-C04 | Edge Case – Add same product multiple times**
- Steps: Open a product → Click "Add to Cart" 5 times consecutively
- Expected: Cart quantity for that product updates to 5 (no duplicate line items); no errors thrown

---

## Task 2: Automation – Search & Add to Cart

### Project Structure
```
AdNabuTestStore_Automation/
├── pages/
│   ├── home_page.py            # Search + store unlock
│   ├── search_results_page.py  # Click first product
│   └── product_page.py         # Add to cart + verify
├── tests/
│   └── test_search_add_to_cart.py  # Main test
├── utils/
│   └── driver_factory.py       # Chrome WebDriver setup
├── requirements.txt
└── README.md
```

### Setup

```bash
pip install -r requirements.txt
```

### Run the Test

```bash
python tests/test_search_add_to_cart.py
```

### Run from Eclipse (PyDev)
1. File → Import → Existing Projects into Workspace
2. Browse to `c:\Users\Ezhil\eclipse-workspace\AdNabuTestStore_Automation`
3. Right-click `test_search_add_to_cart.py` → Run As → Python Run

### Design Decisions
- No `time.sleep()` — all waits use `WebDriverWait` with `expected_conditions`
- Page Object Model keeps locators and actions separate from test logic
- Store password unlock handled automatically in `HomePage.open()`
