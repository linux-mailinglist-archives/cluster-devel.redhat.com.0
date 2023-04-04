Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BA6D6B17
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 20:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680631406;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=j+7ZCT+Pf0YcsfPITU7CN2rDsQIDtzejfhpbv6GMkxk=;
	b=Lnwpez3E8KUwUvJWxxVfcvxntHDUednY7pMmOYcyTSwT/NFI31xeRE/VNbkcGcnyQs1Vke
	gGzvrJZqnfbOLvizWEZc2Fa9lF5sE3nBsw/qbKInloB9yUMJgegGdFDxD4Epedjx1K/NVy
	paqXCUwj+gRI8gvlmfE8oOwdwDNfJcY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-plCSs9opP8KMU_9tGybLpQ-1; Tue, 04 Apr 2023 14:03:22 -0400
X-MC-Unique: plCSs9opP8KMU_9tGybLpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C00E42800486;
	Tue,  4 Apr 2023 18:03:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5927B202701F;
	Tue,  4 Apr 2023 18:03:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2A5D1946A43;
	Tue,  4 Apr 2023 18:03:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3658E1946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 18:03:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E11E42027062; Tue,  4 Apr 2023 18:03:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9B482027061
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 18:03:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78335185A794
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 18:03:05 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-_PaSgTTeP_GA6hidP_Wt2w-1; Tue, 04 Apr 2023 14:02:58 -0400
X-MC-Unique: _PaSgTTeP_GA6hidP_Wt2w-1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370081694"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="370081694"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932533140"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="932533140"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 04 Apr 2023 11:01:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pjkyQ-000Py2-22;
 Tue, 04 Apr 2023 18:01:38 +0000
Date: Wed, 5 Apr 2023 02:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, djwong@kernel.org,
 dchinner@redhat.com, ebiggers@kernel.org, hch@infradead.org,
 linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Message-ID: <202304050102.zJkNrHah-lkp@intel.com>
References: <20230404145319.2057051-21-aalbersh@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230404145319.2057051-21-aalbersh@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v2 20/23] xfs: add fs-verity support
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
Cc: linux-ext4@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, oe-kbuild-all@lists.linux.dev, xiang@kernel.org,
 jth@kernel.org, linux-erofs@lists.ozlabs.org,
 Andrey Albershteyn <aalbersh@redhat.com>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: intel.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on kdave/for-next tytso-ext4/dev jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev linus/master v6.3-rc5]
[cannot apply to next-20230404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Albershteyn/xfs-Add-new-name-to-attri-d/20230404-230224
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230404145319.2057051-21-aalbersh%40redhat.com
patch subject: [PATCH v2 20/23] xfs: add fs-verity support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230405/202304050102.zJkNrHah-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1324353702eaba7da1643d589631adcaedf9a046
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andrey-Albershteyn/xfs-Add-new-name-to-attri-d/20230404-230224
        git checkout 1324353702eaba7da1643d589631adcaedf9a046
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050102.zJkNrHah-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'xfs_check_ondisk_structs',
       inlined from 'init_xfs_fs' at fs/xfs/xfs_super.c:2307:2:
>> include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_1674' declared with attribute error: XFS: value of strlen(XFS_VERITY_DESCRIPTOR_NAME) is wrong, expected XFS_VERITY_DESCRIPTOR_NAME_LEN
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_ondisk.h:19:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      19 |         BUILD_BUG_ON_MSG((value) != (expected), \
         |         ^~~~~~~~~~~~~~~~
   fs/xfs/xfs_ondisk.h:194:9: note: in expansion of macro 'XFS_CHECK_VALUE'
     194 |         XFS_CHECK_VALUE(strlen(XFS_VERITY_DESCRIPTOR_NAME),
         |         ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_1674 +397 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  383  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  384  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  385  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  386  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  387  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  388   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  389   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  390   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  391   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  392   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  393   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  394   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  395   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  396  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @397  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  398  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

