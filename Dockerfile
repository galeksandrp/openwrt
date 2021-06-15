FROM galeksandrp/openwrt:ipq807x-5.15-pr-ci
COPY --chown=ng:ng .git /home/ng/openwrt/.git
#USER root

RUN git checkout $(git diff --name-only)
#RUN git diff --name-only > /home/ng/openwrt-diff.txt
#RUN git checkout $(cat /home/ng/openwrt-diff.txt)
RUN git clean -fd
#RUN chown ng:ng $(cat /home/ng/openwrt-diff.txt)
#USER ng
#RUN rm -rf feeds/galeksandrp_packages*

RUN ./feeds.sh
#RUN cp diffconfig .config
#RUN make defconfig

#RUN ./scripts/diffconfig.sh > diffconfig

RUN make -j$(nproc)

RUN rm -rf /home/ng/openwrt/.git
