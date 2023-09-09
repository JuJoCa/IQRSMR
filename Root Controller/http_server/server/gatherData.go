package server

import (
	"encoding/csv"
	"encoding/json"
	"io"
	"log"
	"os"
	"path/filepath"
	"strings"
)

type Data struct {
	Node1  string
	Node2  string
	Bwd    string
	Delay  string
	PkLoss string
}

func GlobalBandwidth() {
	dir := "/home/kandoo18/Documentos/http_server/bandwidth/bw_total*.txt"

	paths, err := filepath.Glob(dir)
	if err != nil {
		log.Fatal(err)
	}

	var bwT []byte
	if len(paths) > 0 {
		for long, filename := range paths {
			content, err := os.ReadFile(filename)
			if err != nil {
				log.Fatal(err)
			}
			if long < len(paths)-1 {
				content = append(content, byte(10))
			}
			bwT = append(bwT, content...)
		}

		dataString := strings.Split(string(bwT), "\n")
		valNormal, _ := removeDuplicate(dataString)

		var byteBW []byte
		for _, val := range valNormal {
			byteBW = append(byteBW, []byte(val)...)
			byteBW = append(byteBW, byte(10))
		}

		err = os.WriteFile("totalData/totalBandwidth.txt", byteBW, 0664)
		if err != nil {
			log.Fatal(err)
		}
	}
}

func GlobalTopology() {
	dir := "/home/kandoo18/Documentos/http_server/topology/Topology*.json"

	paths, err := filepath.Glob(dir)
	
	if err != nil {
		log.Fatal(err)
	}

	result := make(map[string][]Link)
	if len(paths) > 0 {
		for _, filename := range paths {
			content, err := os.ReadFile(filename)
			if err != nil {
				log.Fatal(err)
			}

			topo := Topology{}

			err = json.Unmarshal(content, &topo.Datos)
			if err != nil {
				log.Fatal(err)
			}

			for k, val := range topo.Datos {
				result[k] = val
			}
		}

		out, err := json.MarshalIndent(result, "", " ")
		if err != nil {
			log.Fatal(err)
		}

		err = os.WriteFile("totalData/totalTopology.json", out, 0664)
		if err != nil {
			log.Fatal(err)
		}
	}
}

func GlobalMetrics() {
	dir := "/home/kandoo18/Documentos/http_server/metrics/net_info*.csv"

	paths, err := filepath.Glob(dir)
	if err != nil {
		log.Fatal(err)
	}

	var mts []Data
	if len(paths) > 0 {
		for _, filename := range paths {
			file, err := os.Open(filename)
			if err != nil {
				log.Fatal(err)
			}
			defer file.Close()

			data, err := readCSV(file)
			if err != nil {
				panic(err)
			}
			mts = append(mts, data...)
		}

		err = writeCSV(mts, "totalData/totalMetrics.csv")
		if err != nil {
			panic(err)
		}
	}
}

func readCSV(file io.Reader) ([]Data, error) {
	reader := csv.NewReader(file)

	// Configurar el delimitador y otros ajustes según corresponda
	reader.Comma = ','
	reader.Comment = '#'
	reader.FieldsPerRecord = -1

	var data []Data

	// Leer los registros CSV
	headerSkipped := false
	for {
		record, err := reader.Read()
		if err == io.EOF {
			break
		} else if err != nil {
			return nil, err
		}

		if !headerSkipped {
			headerSkipped = true
			continue
		}

		// Crear una estructura de datos con los campos del registro CSV
		dataRecord := Data{
			Node1:  record[0],
			Node2:  record[1],
			Bwd:    record[2],
			Delay:  record[3],
			PkLoss: record[4],
		}

		// Agregar la estructura de datos a la lista
		data = append(data, dataRecord)
	}

	return data, nil
}

func writeCSV(data []Data, filename string) error {
	file, err := os.Create(filename)
	if err != nil {
		return err
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	header := []string{"node1", "node2", "bwd", "delay", "pkloss"}
	err = writer.Write(header)
	if err != nil {
		return err
	}

	// Escribir los registros CSV
	for _, record := range data {
		err := writer.Write([]string{
			record.Node1,
			record.Node2,
			record.Bwd,
			record.Delay,
			record.PkLoss,
		})
		if err != nil {
			return err
		}
	}

	return nil
}

func removeDuplicate(arr []string) ([]string, []string) {
	mapOne := make(map[string]struct{})
	mapTwo := make(map[string]struct{})

	for _, val := range arr {
		if _, found := mapOne[val]; found {
			mapTwo[val] = struct{}{}
		} else {
			mapOne[val] = struct{}{}
		}
	}

	mapTree := make([]string, 0, len(mapOne))

	for key1 := range mapOne {
		mapTree = append(mapTree, key1)
	}

	mapFour := make([]string, 0, len(mapTwo))

	for key2 := range mapTwo {
		mapFour = append(mapFour, key2)
	}
	return mapTree, mapFour
}
