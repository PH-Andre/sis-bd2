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
        <h1>Todas Bibliotecas Criadas</h1>


        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $titulo = 'nome_biblioteca';
        $codigoBarras = 'leitor_nome';
    /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
        'SELECT ' . $titulo .
        '     , ' . $codigoBarras.
       /*TODO-2: Adicione cada variavel a consulta abaixo */
        '  FROM biblioteca_leitor join leitor on leitor.leitor_ID = biblioteca_leitor.proprietario_biblio; ';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Nome da biblioteca' . '</th>' .
            '        <th>' . 'Criada por ' . '</th>' .
        
            
            /* TODO-3: Adicione as variaveis ao cabeçalho da tabela */
           
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$titulo] . '</td>' .
                    '<td>' . $registro[$codigoBarras] . '</td>';
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