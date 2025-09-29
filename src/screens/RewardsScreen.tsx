import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';

const RewardsScreen = () => {
  return (
    <ScrollView style={styles.container}>
      {/* Header with Image Space */}
      <View style={styles.header}>
        <View style={styles.imageSpace}>
          <Text style={styles.imagePlaceholder}>🏆</Text>
        </View>
        <Text style={styles.headline}>Your Rewards</Text>
      </View>

      {/* Content */}
      <View style={styles.content}>
        <Text style={styles.loremText}>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        </Text>
        <Text style={styles.loremText}>
          Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </Text>
        <Text style={styles.loremText}>
          Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
        </Text>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  header: {
    backgroundColor: '#fff',
    padding: 20,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.1,
    shadowRadius: 3.84,
    elevation: 5,
  },
  imageSpace: {
    width: 120,
    height: 120,
    backgroundColor: '#fff3e0',
    borderRadius: 60,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 15,
  },
  imagePlaceholder: {
    fontSize: 48,
  },
  headline: {
    fontSize: 24,
    fontWeight: 'bold',
    color: '#333',
  },
  content: {
    padding: 20,
  },
  loremText: {
    fontSize: 16,
    lineHeight: 24,
    color: '#666',
    marginBottom: 15,
    textAlign: 'justify',
  },
});

export default RewardsScreen;
