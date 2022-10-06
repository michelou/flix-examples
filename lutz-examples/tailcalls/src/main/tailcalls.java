
class Tailcalls {

    static int sumup(int n) {
        return tailsum(0, n);
    }

    static int tailsum(int m, int n) {
        if (n == 0) {
            return m;
        } else {
            return tailsum(m +n, n - 1);
        }
    }

    // Gibt einen StackOverflowError
    public static void main(String[] args) {
        System.out.println(sumup(25000));
    }
}
