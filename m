Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0681B63485F
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 21:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669149528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q8GaL7PyAqxg3X3981LsBHvl2rWaG2kqvL/QwIn/TDw=;
	b=HL+9f94llfOpDCKjU+p6PxcTZhS9n3zD7ID22VC8YuCmCFDzvIXH0UtxPVFRe1HpTgC13j
	NFx5IOkcUzJ1ZpobzGcvSlB3QMSQBdUDXoHyUW4b3v98Lv1JiiDI8si1jG8c2Mx+Lu4pIY
	TsDkHXT8bjpjxbgE/MIMke4WdmmTIvI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-Xf87xT4JNh-Q4agWR-lFEw-1; Tue, 22 Nov 2022 15:38:47 -0500
X-MC-Unique: Xf87xT4JNh-Q4agWR-lFEw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D4AB29AA389;
	Tue, 22 Nov 2022 20:38:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A01134A9254;
	Tue, 22 Nov 2022 20:38:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1EBC2194658D;
	Tue, 22 Nov 2022 20:38:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9AB521946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 20:38:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 764B640C83DF; Tue, 22 Nov 2022 20:38:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 710A840C835A
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 20:38:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47BC5101E14F
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 20:38:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-Qre_KwqBOy-wrhVNYbw7fQ-1; Tue, 22 Nov 2022 15:38:39 -0500
X-MC-Unique: Qre_KwqBOy-wrhVNYbw7fQ-1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="340784158"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="340784158"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 12:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="766463310"
X-IronPort-AV: E=Sophos;i="5.96,185,1665471600"; d="scan'208";a="766463310"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 22 Nov 2022 12:37:31 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oxa1L-0001pX-0I;
 Tue, 22 Nov 2022 20:37:31 +0000
Date: Wed, 23 Nov 2022 04:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <637d32fc.J7JDZVofmP9NLBs4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [linux-next:master] BUILD REGRESSION
 771a207d1ee9f38da8c0cee1412228f18b900bac
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 771a207d1ee9f38da8c0cee1412228f18b900bac  Add linux-next specific files for 20221122

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211130053.Np70VIdn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211211917.yLICUnMb-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211221848.N0WN2GK3-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211221932.A1a12yLH-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211222131.H2kT55xh-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211222348.riEBQcJQ-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "__ld_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "lockdep_is_held" [fs/dlm/dlm.ko] undefined!
arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3c24xx.h: No such file or directory
drivers/clk/clk.c:1022:5: error: redefinition of 'clk_prepare'
drivers/clk/clk.c:1268:6: error: redefinition of 'clk_is_enabled_when_prepared'
drivers/clk/clk.c:941:6: error: redefinition of 'clk_unprepare'
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4968: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5075:24: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Wenum-conversion]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:139:43: warning: unused variable 'dmub_outbox_irq_info_funcs' [-Wunused-const-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for function 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for function 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for function 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for function 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for function 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
fs/dlm/lowcomms.c:623: undefined reference to `lockdep_is_held'
include/net/sock.h:1713: undefined reference to `lockdep_is_held'
ld.lld: error: undefined symbol: devm_drm_of_get_bridge
ld.lld: error: undefined symbol: drm_atomic_get_new_connector_for_encoder
ld.lld: error: undefined symbol: drm_atomic_helper_bridge_destroy_state
ld.lld: error: undefined symbol: drm_atomic_helper_bridge_duplicate_state
ld.lld: error: undefined symbol: drm_atomic_helper_bridge_reset
ld.lld: error: undefined symbol: drm_bridge_add
ld.lld: error: undefined symbol: drm_bridge_attach
ld.lld: error: undefined symbol: drm_bridge_remove
ld.lld: error: undefined symbol: drm_of_get_data_lanes_count_ep
ld.lld: error: undefined symbol: lockdep_is_held
microblaze-linux-ld: (.text+0x158): undefined reference to `drm_bridge_add'
microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o:(.rodata+0x3b4): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o:(.rodata+0x3b8): undefined reference to `drm_atomic_helper_bridge_destroy_state'
microblaze-linux-ld: drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.o:(.rodata+0x3c8): undefined reference to `drm_atomic_helper_bridge_reset'

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/nouveau/nvkm/falcon/base.c:47:23: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting
s390x-linux-ld: hidma.c:(.text+0x7e): undefined reference to `devm_ioremap_resource'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- alpha-randconfig-m041-20221121
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-randconfig-c003-20221120
|   `-- ERROR:__ld_r13_to_r22-lib-zstd-zstd_decompress.ko-undefined
|-- arm-allyesconfig
|   |-- arch-arm-mach-s3c-devs.c:fatal-error:linux-platform_data-dma-s3c24xx.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-defconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-randconfig-c002-20221115
|   `-- drivers-gpu-drm-nouveau-nvkm-falcon-base.c:warning:use-of-uninitialized-value-unknown-CWE
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
clang_recent_errors
|-- arm-randconfig-r016-20221121
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|-- arm64-randconfig-r026-20221122
|   |-- ld.lld:error:undefined-symbol:devm_drm_of_get_bridge
|   |-- ld.lld:error:undefined-symbol:drm_atomic_get_new_connector_for_encoder
|   |-- ld.lld:error:undefined-symbol:drm_atomic_helper_bridge_destroy_state
|   |-- ld.lld:error:undefined-symbol:drm_atomic_helper_bridge_duplicate_state
|   |-- ld.lld:error:undefined-symbol:drm_atomic_helper_bridge_reset
|   |-- ld.lld:error:undefined-symbol:drm_bridge_add
|   |-- ld.lld:error:undefined-symbol:drm_bridge_attach
|   |-- ld.lld:error:undefined-symbol:drm_bridge_remove
|   `-- ld.lld:error:undefined-symbol:drm_of_get_data_lanes_count_ep
|-- hexagon-randconfig-r045-20221121
|   `-- ld.lld:error:undefined-symbol:lockdep_is_held
|-- powerpc-randconfig-r016-20221120
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|-- riscv-randconfig-r042-20221120
|   `-- ld.lld:error:too-many-errors-emitted-stopping-now-(use-error-limit-to-see-all-errors)
|-- s390-randconfig-r026-20221120
|   `-- ERROR:devm_ioremap_resource-drivers-dma-qcom-hdma.ko-undefined
|-- s390-randconfig-r031-20221121
|   `-- s39-linux-ld:hidma.c:(.text):undefined-reference-to-devm_ioremap_resource
|-- s390-randconfig-r033-20221121
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-function-to_dal_irq_source_dcn201
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:unused-variable-dmub_outbox_irq_info_funcs
|-- s390-randconfig-r044-20221120
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-function-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:unused-variable-dmub_outbox_irq_info_funcs
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
`-- x86_64-rhel-8.3-rust
    `-- ERROR:lockdep_is_held-fs-dlm-dlm.ko-undefined

elapsed time: 736m

configs tested: 77
configs skipped: 4

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
i386                 randconfig-a011-20221121
i386                 randconfig-a013-20221121
x86_64                               rhel-8.3
i386                 randconfig-a012-20221121
i386                 randconfig-a014-20221121
i386                 randconfig-a015-20221121
x86_64               randconfig-a012-20221121
i386                 randconfig-a016-20221121
x86_64               randconfig-a011-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a016-20221121
x86_64               randconfig-a014-20221121
m68k                             allmodconfig
x86_64                           allyesconfig
x86_64               randconfig-a015-20221121
m68k                             allyesconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                       m5249evb_defconfig
powerpc                      ep88xc_defconfig
sparc                       sparc32_defconfig
mips                           jazz_defconfig
arm                           sama5_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            xcep_defconfig
sh                        edosk7705_defconfig
parisc64                         alldefconfig
arc                  randconfig-r043-20221120
riscv                randconfig-r042-20221121
arc                  randconfig-r043-20221121
s390                 randconfig-r044-20221121
i386                                defconfig
arm                                 defconfig
x86_64                          rhel-8.3-func
s390                                defconfig
x86_64                           rhel-8.3-kvm
s390                             allmodconfig
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
arm                              allyesconfig
powerpc                          allmodconfig
arm64                            allyesconfig
sh                               allmodconfig
i386                             allyesconfig

clang tested configs:
arm                        neponset_defconfig
x86_64               randconfig-a004-20221121
powerpc                 xes_mpc85xx_defconfig
x86_64               randconfig-a001-20221121
i386                 randconfig-a004-20221121
i386                 randconfig-a001-20221121
x86_64               randconfig-a003-20221121
i386                 randconfig-a003-20221121
x86_64               randconfig-a002-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a002-20221121
x86_64               randconfig-a005-20221121
arm                         lpc32xx_defconfig
x86_64               randconfig-a006-20221121
i386                 randconfig-a006-20221121
arm                         bcm2835_defconfig
powerpc                    mvme5100_defconfig
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

