<div id=form2>
    <form method="post" action="">
        <fieldset id=borda>
            <label for="Nome_autor">Nome Autor: </label>
            <br />
            <input type="text" name="Nome_autor" id="Nome_autor" class="campo1" value="<?php echo $cpf ?>"/>
           
            <br />
            <label for="name">data de nascimento conforme exemplo(1997-11-27)</label>
            <br />
            <input type="text" name="nome" id="nome" value="<?php echo $nome ?>" />
            <br />
            <label for="telefone">CPF</label>
            <br />
            <input type="text" name="telefone" id="telefone" value="<?php echo $telefone ?>" />
            <br />
                <div class="button">
              <button type="submit" name="salvar"><img src="botao.png"></button>
                </div>
        </fieldset>
    </form>
</div>