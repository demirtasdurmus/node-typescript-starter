import { sumTotal } from '@/index';

describe('sumTotal', () => {
  it('should return the sum of two numbers', () => {
    expect(sumTotal(1, 2)).toBe(3);
  });
});
