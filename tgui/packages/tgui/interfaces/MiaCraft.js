import { useBackend, useSharedState } from '../backend';
import { Window } from '../layouts';
import {
  Button,
  LabeledList,
  Collapsible,
  Flex,
} from 'tgui-core/components';
import { useState } from 'react';

export const MiaCraft = (props, context) => {
  const { act, data } = useBackend();
  const busy = data.busy;
  const [category, setCategory] = useState();
  const [subcategory, setSubcategory] = useState();
  const craftability = Object.entries(data.craftability);
  const [crafting_recipes] = useState(data.crafting_recipes);
  const [onlyCraftable, setOnlyCraftable] = useState(true);
  
  return(
    <Window title='Crafting' width={800} height={600} resizeable>
      <Window.Content scrollable>
        <Flex>
          <Flex.Item basis="30%">
            <LabeledList>
              <LabeledList.Item label="Show only craftables">
                <input type="checkbox" checked={onlyCraftable} onClick={() => setOnlyCraftable(!onlyCraftable)} />
              </LabeledList.Item>
            </LabeledList>
          </Flex.Item>
          <Flex.Item basis="70%">
            {
              Object.entries(crafting_recipes).map(([key, item]) => (
                <CraftingCategory crafties={item} key3={key} onlyCraftable={onlyCraftable} craftability={craftability} key={key} actfunc={act} />
              ))
            }
          </Flex.Item>
        </Flex>
      </Window.Content>
    </Window>
  );
  
};

  function CraftingCategory({ crafties, key3, onlyCraftable, craftability, key, actfunc}) {
    const visibleElements = Object.entries(crafties).filter(([key2, item2]) => !onlyCraftable || craftability.some(object => object[0] === item2.name && object[1] === 1));
      return (visibleElements.length > 0 ? 
        <Collapsible title={key3}>
          {visibleElements.map(([key2, item2]) => (
            <CraftingRecipe recipe={item2} key={key2} craftability={craftability} actfunc={actfunc}/>
          ))}
          
        </Collapsible> 
      : null);
  }
  function CraftingRecipe({ recipe, key, craftability, actfunc }) {
    return(
      <Collapsible title={recipe.name} key={key} style={{ 'margin-left': '10px', backgroundColor: craftability.some(object => object[0] === recipe.name && object[1] === 1) ? "" : "grey" }}>
        <LabeledList >
          <LabeledList.Item label="Ingredients" style={{ 'margin-left': '20px' }}>
            {recipe.req_text}
          </LabeledList.Item>
          <LabeledList.Item label="Difficulty" style={{ 'margin-left': '20px' }}>
            {recipe.craftingdifficulty}
          </LabeledList.Item>
          <LabeledList.Item label="Tool" style={{ 'margin-left': '20px' }}>
            {recipe.tool_text}
          </LabeledList.Item>
          <LabeledList.Item label="Catalyst" style={{ 'margin-left': '20px' }}>
            {recipe.catalyst_text}
          </LabeledList.Item>
          <LabeledList.Item label="Craft it!" style={{ 'margin-left': '20px' }}>
            <Button content="Craft" onClick={() => {
              actfunc('craft', {
                item : recipe.path,
              });
            }}
            />
          </LabeledList.Item>
        </LabeledList>
      </Collapsible>
    );

  }