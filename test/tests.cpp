#include <gtest/gtest.h>

TEST(TestSuite, DummyTest){
    ASSERT_TRUE(true);
}

TEST(TestSuite, BadDummyTest){
  int *array = new int[100];
  delete [] array;
  //int x = array[0];  // BOOM
    ASSERT_TRUE(true);
}

int main(int argc, char** argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
