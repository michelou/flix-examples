
class MutualRecursion {

    static boolean isOdd(int n) {
        return (n == 0) ? false : isEven(n - 1);
    }

    static boolean isEven(int n) {
        return (n == 0) ? true : isOdd(n - 1);
    }

    // Gibt einen StackOverflowError
    public static void main(String[] args) {
        System.out.println(isEven(25000));
    }
}
