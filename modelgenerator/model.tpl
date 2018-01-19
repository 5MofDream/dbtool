{{$exportModelName := .ModelName | TitleCharUpper}}

package {{.PackageName}}

import (
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"time"
)

type {{$exportModelName}} struct {
   {{range .TableSchema}}{{.COLUMN_NAME | ExportColumn}} {{.DATA_TYPE | TypeConvert}} {{if eq .COLUMN_KEY "PRI"}}{{.COLUMN_NAME | TagsKey}}{{else}}{{.COLUMN_NAME | Tags}}{{end}} // {{.COLUMN_COMMENT}}
{{end}}}

func ({{$exportModelName}}) TableName() string {
  return "{{.TableName}}"
}
