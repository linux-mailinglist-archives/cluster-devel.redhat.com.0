Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 578784DBD89
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Mar 2022 04:26:10 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-kcXWrxL9Oi6hjIXcNmejOQ-1; Wed, 16 Mar 2022 23:26:06 -0400
X-MC-Unique: kcXWrxL9Oi6hjIXcNmejOQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 360DE868A18;
	Thu, 17 Mar 2022 03:26:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6ACD5401E58;
	Thu, 17 Mar 2022 03:26:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F3862194035E;
	Thu, 17 Mar 2022 03:26:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 385251949761 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 17 Mar 2022 03:26:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A8B78215688A; Thu, 17 Mar 2022 03:26:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A46EA2156A5A
 for <cluster-devel@redhat.com>; Thu, 17 Mar 2022 03:25:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 253883C01D9E
 for <cluster-devel@redhat.com>; Thu, 17 Mar 2022 03:25:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-eqY8ej8FOKmawuosa-zBJw-1; Wed, 16 Mar 2022 23:25:54 -0400
X-MC-Unique: eqY8ej8FOKmawuosa-zBJw-1
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="255602477"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="255602477"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 20:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="581153489"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 16 Mar 2022 20:25:51 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUglq-000DFQ-BU; Thu, 17 Mar 2022 03:25:50 +0000
Date: Thu, 17 Mar 2022 11:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202203171137.AU0RE6e4-lkp@intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [Cluster-devel] [gfs2:for-next 11/11] fs/gfs2/file.c:796:24:
 sparse: sparse: incompatible types in comparison expression (different type
 sizes):
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
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   a20050c14edf19add5a9588cb196bb00aa410650
commit: a20050c14edf19add5a9588cb196bb00aa410650 [11/11] gfs2: Add read/write page 'fault_stats'
config: sh-randconfig-s032-20220313 (https://download.01.org/0day-ci/archive/20220317/202203171137.AU0RE6e4-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=a20050c14edf19add5a9588cb196bb00aa410650
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 for-next
        git checkout a20050c14edf19add5a9588cb196bb00aa410650
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sh SHELL=/bin/bash fs/gfs2/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/gfs2/file.c:796:24: sparse: sparse: incompatible types in comparison expression (different type sizes):
   fs/gfs2/file.c:796:24: sparse:    unsigned int *
>> fs/gfs2/file.c:796:24: sparse:    unsigned long *
   fs/gfs2/file.c:796:24: sparse: sparse: cannot size expression

vim +796 fs/gfs2/file.c

   772	
   773	static inline bool should_fault_in_pages(ssize_t ret, struct iov_iter *i,
   774						 size_t *prev_count,
   775						 size_t *window_size)
   776	{
   777		size_t count = iov_iter_count(i);
   778		size_t size, offs;
   779	
   780		if (likely(!count))
   781			return false;
   782		if (ret <= 0 && ret != -EFAULT)
   783			return false;
   784		if (!iter_is_iovec(i))
   785			return false;
   786	
   787		size = PAGE_SIZE;
   788		offs = offset_in_page(i->iov[0].iov_base + i->iov_offset);
   789		if (*prev_count != count || !*window_size) {
   790			int nr_dirtied;
   791	
   792			size = ALIGN(offs + count, PAGE_SIZE);
   793			size = min_t(size_t, size, SZ_1M);
   794			nr_dirtied = max(current->nr_dirtied_pause -
   795					 current->nr_dirtied, 8);
 > 796			size = min(size, nr_dirtied * PAGE_SIZE);
   797		}
   798	
   799		*prev_count = count;
   800		*window_size = size - offs;
   801		return true;
   802	}
   803	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

