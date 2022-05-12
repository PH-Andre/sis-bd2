<!DOCTYPE html>

<head>
    <style>
        .content {
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>

<html>

<body>
    <div class="content">
        <h1>Leitores</h1>


        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $titulo = 'leitor_nome';
        $codigoBarras = 'leitor_cpf';
        $genero = 'leitor_idade';
        
        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'SELECT ' . $titulo .
            '     , ' . $genero .
            '     , ' . $codigoBarras.
           /*TODO-2: Adicione cada variavel a consulta abaixo */
            '  FROM leitor';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Nome' . '</th>' .
            '        <th>' . 'CPF' . '</th>' .
            /* TODO-3: Adicione as variaveis ao cabeçalho da tabela */
           '        <th>' . 'Data de Nascimento' . '</th>' .
            
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$titulo] . '</td>' .
                    '<td>' . $registro[$codigoBarras] . '</td>' .
                    /* TODO-4: Adicione a tabela os novos registros. */
                    '<td>' . $registro[$genero] . '</td>';
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '';
        }
         FecharConexao($conexao);
        ?>
   
    </div>
    <div class="content">
        </body>

</html>