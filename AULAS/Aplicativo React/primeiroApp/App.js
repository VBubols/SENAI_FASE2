import { StatusBar } from 'expo-status-bar';
import { useState } from 'react';
import { Button, StyleSheet, Text, TextInput, View } from 'react-native';

export default function App() {
  const [primeiroNumero, setPrimeiroNumero] = useState(0);
  const [segundoNumero, setSegundoNumero] = useState(0);
  const [resultado, setResultado] = useState(0);

  const calcSoma = () => {
    setResultado(parseFloat(primeiroNumero) + parseFloat(segundoNumero))
  }
  const calcSub = () => {
    setResultado(parseFloat(primeiroNumero) - parseFloat(segundoNumero))
  }
  const calcDiv = () => {
    setResultado(parseFloat(primeiroNumero) / parseFloat(segundoNumero))
  }
  const calcMul = () => {
    setResultado(parseFloat(primeiroNumero) * parseFloat(segundoNumero))
  }  
  return (
    <View style={styles.container}>
      <Text>
        Calculadora {resultado}
      </Text>

      <TextInput placeholder='Digite o primeiro número' style={styles.input} onChangeText={setPrimeiroNumero}></TextInput>
      <TextInput placeholder='Digite o segundo número' style={styles.input} onChangeText={setSegundoNumero}></TextInput>

      <View style={styles.divBotoes}>
        <Button onPress={calcSoma} title='+' style={styles.botoes}></Button>
        <Button onPress={calcSub} title='-' style={styles.botoes}></Button>
        <Button onPress={calcDiv} title='/' style={styles.botoes}></Button>
        <Button onPress={calcMul} title='*' style={styles.botoes}></Button>
      </View>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  input: {
    padding: 12,
    margin: 2,
    color: '#fff',
    backgroundColor: '#333'
  },
  divBotoes: {
    flexDirection: 'row',
    justifyContent: 'center',
    marginTop: 10,
    gap: 10,
    width: '100%'
  },
  botoes: {
    margin: 5
  }
});
