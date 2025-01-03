import { useBackend, useSharedState } from '../backend';
import { Box, Button, Icon, Section, Tooltip, Tabs } from '../components';
import { Window } from '../layouts';

export const SpawnersMenu = (props, context) => {
  return (
    <Window title="Spawners Menu" width={700} height={600}>
      <Window.Content overflow="auto">
        <SpawnerContent />
      </Window.Content>
    </Window>
  );
};

export const SpawnerContent = (props, context) => {
  const { act, data } = useBackend(context);
  const [tab, setTab] = useSharedState(context, 'tab', 'misc');
  const spawners = data.spawners || [];
  const misc = spawners.filter((spawner) => spawner.category === 'misc');
  const syndicate = spawners.filter((spawner) => spawner.category === 'syndicate');
  const inteq = spawners.filter((spawner) => spawner.category === 'inteq');
  const midround = spawners.filter((spawner) => spawner.category === 'midround');
	const special = spawners.filter((spawner) => spawner.category === 'special');
	const offstation = spawners.filter((spawner) => spawner.category === 'offstation');

  return (
    <Box>
      <Section fitted>
        <Tabs>
          <Tabs.Tab
            icon="ghost"
            selected={tab === 'misc'}
            onClick={() => setTab('misc')}>
            Misc ({misc.length})
          </Tabs.Tab>
          <Tabs.Tab
            icon="handshake"
            selected={tab === 'syndicate'}
            onClick={() => setTab('syndicate')}>
            Syndicate ({syndicate.length})
          </Tabs.Tab>
          <Tabs.Tab
            icon="skull-crossbones"
            selected={tab === 'inteq'}
            onClick={() => setTab('inteq')}>
            InteQ ({inteq.length})
          </Tabs.Tab>
          <Tabs.Tab
            icon="dice-five"
            selected={tab === 'midround'}
            onClick={() => setTab('midround')}>
            Mid-Round ({midround.length})
          </Tabs.Tab>
					<Tabs.Tab
            icon="heart"
            selected={tab === 'special'}
            onClick={() => setTab('special')}>
            Special ({special.length})
          </Tabs.Tab>
					<Tabs.Tab
            icon="person-digging"
            selected={tab === 'offstation'}
            onClick={() => setTab('offstation')}>
            Off-Station ({offstation.length})
          </Tabs.Tab>
        </Tabs>
      </Section>
      {tab === 'misc' && <RolelistMisc spawners={misc} />}
      {tab === 'syndicate' && <RolelistSyndicate spawners={syndicate} />}
      {tab === 'inteq' && <RolelistInteq spawners={inteq} />}
      {tab === 'midround' && <RolelistMidround spawners={midround} />}
			{tab === 'special' && <RolelistSpecial spawners={special} />}
			{tab === 'offstation' && <RolelistOffstation spawners={offstation} />}
    </Box>
  );
};

export const RolelistItem = (props, context) => {
  const spawner = props.spawner || {};
  const { act } = useBackend(context);

  return (
    <Section
      key={spawner.name}
      title={spawner.name + ' (' + spawner.amount_left + ' left)'}
      level={2}
      buttons={
        <>
          <Tooltip
            content={
              spawner.can_load_appearance === 2
                ? 'This role forces using your characters.'
                : spawner.can_load_appearance
                ? 'This role allows using your characters.'
                : 'This role does not allow using your characters.'
            }>
            <Icon
              name="user"
              mr="4px"
              color={
                spawner.can_load_appearance === 2
                  ? 'yellow'
                  : spawner.can_load_appearance
                  ? 'green'
                  : 'red'
              }
            />
          </Tooltip>
          <Button
            content="Jump"
            onClick={() => act('jump', { name: spawner.name })}
          />
          <Button
            content="Spawn"
            onClick={() => act('spawn', { name: spawner.name })}
          />
        </>
      }>
      <Box bold mb={1} fontSize="20px">
        {spawner.short_desc}
      </Box>
      <Box>{spawner.flavor_text}</Box>
      {!!spawner.important_info && (
        <Box mt={1} bold color="bad" fontSize="26px">
          {spawner.important_info}
        </Box>
      )}
    </Section>
  );
};

export const RolelistMisc = ({ spawners, context }) => {
  return (
    <Section>
      {spawners.map((spawner) => (
        <RolelistItem key={spawner.name} spawner={spawner} />
      ))}
    </Section>
  );
};

export const RolelistSyndicate = ({ spawners, context }) => {
  return (
    <Section>
      {spawners.map((spawner) => (
        <RolelistItem key={spawner.name} spawner={spawner} />
      ))}
    </Section>
  );
};

export const RolelistInteq = ({ spawners, context }) => {
  return (
    <Section>
      {spawners.map((spawner) => (
        <RolelistItem key={spawner.name} spawner={spawner} />
      ))}
    </Section>
  );
};

export const RolelistMidround = ({ spawners, context }) => {
  return (
    <Section>
      {spawners.map((spawner) => (
        <RolelistItem key={spawner.name} spawner={spawner} />
      ))}
    </Section>
  );
};

export const RolelistSpecial = ({ spawners, context }) => {
  return (
    <Section>
      {spawners.map((spawner) => (
        <RolelistItem key={spawner.name} spawner={spawner} />
      ))}
    </Section>
  );
};

export const RolelistOffstation = ({ spawners, context }) => {
  return (
    <Section>
      {spawners.map((spawner) => (
        <RolelistItem key={spawner.name} spawner={spawner} />
      ))}
    </Section>
  );
};
