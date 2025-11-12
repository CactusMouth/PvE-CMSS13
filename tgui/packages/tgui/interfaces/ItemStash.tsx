import { useBackend } from '../backend';
import { Box, DmIcon, Flex, Icon, Section } from '../components';
import { Window } from '../layouts';


type ItemStashData = {
  logged_in: boolean;
  contents: StoredItems[];
  unique_id: string;
};

type StoredItems = {
  icon: string;
  icon_state: string;
  image: string;
  name: string;
};

export const ItemStash = () => {
  const { data } = useBackend<ItemStashData>();
  const { act } = useBackend();
  const { contents } = data;
  return (
    <Window theme="generic" width={650} height={500}>
      <Window.Content>
        <Flex height='100%'>
          <Flex.Item className="ItemStash_FlexItem " width="450px">
            <Box className="ItemStash_Box">

                <Box className="ItemStash_ItemWindow">
                  {data.logged_in ? (
                  <Box height="100%" width="100%" style={{
                  borderWidth: '5px',
                  backgroundColor: '#37343fff',
                  borderColor: '#25232b',
                  borderStyle: 'solid',
                  }}>
                    <Section fill scrollable>
                      <Flex wrap grow>
                      {contents.map((item, index) => (
                            <Cell
                              name={item.name}
                              key={index}
                              icon={item.icon}
                              icon_state={item.icon_state}
                              index={index}
                            />
                            ))
                          }
                      </Flex>
                    </Section>
                  </Box>
                  ) : (<Box />)
                  }
                </Box>

            </Box>


          </Flex.Item>
          <Flex.Item className="ItemStash_FlexItem" width='185px'>
                <Box pl='5px' width='100%' height='100%'>
                  <Box className="ItemStash_ItemWindow">
                    <Box className="ItemStash_Screen" >
                    {!data.logged_in ? (
                      <Box> Awaiting login...</Box>
                    ):(
                      <Box>Welcome: {data.unique_id}</Box>
                    )}
                    </Box>
                    {data.logged_in ? (
                    <Box
                    className="ItemStash_LoginButton"
                    onClick={() => act('Logout')}
                    >
                      Logout
                    </Box>
                    ):(
                    <Box
                    className="ItemStash_LoginButton"
                    onClick={() => act('Login')}
                    >
                      Login
                    </Box>
                    )}
                  </Box>
                </Box>

          </Flex.Item>
        </Flex>
      </Window.Content>
    </Window>
  );
};

{ /* <Flex width="100%" className="ItemStash_Debug">
          {data.logged_in ? (
            <Flex className="ItemStash_Debug">
              <Flex wrap width="455px" className="ItemStash_Debug">

                  {contents.map((item, index) => (
                    <Cell
                      name={item.name}
                      key={index}
                      icon={item.icon}
                      icon_state={item.icon_state}
                      index={index}
                    />
                    ))
                  }

              </Flex>
              <Box
                width="190px"
                className="ItemStash_Logout"
                onClick={() => act('Logout')}
              >
                Logout
                {data.logged_in}
              </Box>

            </Flex>
            ) : (
              <Box
                className="ItemStash_Login"
                onClick={() => act('Login')}
              >
                Login
              </Box>
            )
          }
        </Flex> */ }

const Cell = (props) => {
  const { act } = useBackend<ItemStashData>();
  return (
    <Flex.Item className="ItemStash_FlexItem" width="80px" height="80px">
      <Box className="ItemStash_Box" position="relative">
        <Box className="ItemStash_ItemBox">
          {props.icon && (
            <Box>
              <DmIcon
                mb={-2}
                icon={props.icon}
                icon_state={props.icon_state}
                fallback={<Icon mt={1} ml={1} name="spinner" spin fontSize="70px" />}
                height="100%"
                width="100%"
                style={{
                  imageRendering: 'pixelated',
                }}
              />
            </Box>
          )}
          <Box
            className="ItemStash_Slot"
            onClick={() => act('ItemClick', { SlotKey: props.index + 1 })}
          >
            {props.name}
          </Box>
        </Box>
      </Box>
    </Flex.Item>
  );
};
