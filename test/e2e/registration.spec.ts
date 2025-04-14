// Kick Inn – Frontend E2E Test (Playwright)
// To be saved as: tests/e2e/registration.spec.ts

import { test, expect } from '@playwright/test';

test.describe('Kick Inn MVP – User Flows', () => {
  test('Ideator Registration and Role Selection', async ({ page }) => {
    await page.goto('http://localhost:3000/register');
    await page.fill('input[name="email"]', 'ideator@kickinn.xyz');
    await page.click('text=Ideator');
    await page.click('button:has-text("Continue")');

    await expect(page).toHaveURL(/.*dashboard/);
    await expect(page.locator('h1')).toContainText('Dashboard');
  });

  test('Submit Idea Form (Ideator)', async ({ page }) => {
    await page.goto('http://localhost:3000/dashboard');
    await page.fill('textarea[name="problem_statement"]', 'Manual invoicing is slow.');
    await page.selectOption('select[name="category"]', 'Fintech');
    await page.click('button:has-text("Submit")');

    await expect(page.locator('.toast')).toContainText('Idea submitted');
  });

  test('Investor Deal View and Wallet Connect (Mock)', async ({ page }) => {
    await page.goto('http://localhost:3000/deals/test-id');
    await expect(page.locator('h2')).toContainText('Deal');
    await expect(page.locator('button')).toContainText('Connect Wallet');
  });
});
