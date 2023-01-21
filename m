Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44867661D
	for <lists+cluster-devel@lfdr.de>; Sat, 21 Jan 2023 12:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674302012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=P1sMfn2wn+TrT7QWFYEmxoagh/Ni/yX5kiJ29R0vPuo=;
	b=A+xvXNNE1XbhuGEa5vJ10eb+6ic7rYvQBtzeCciIa3AIBINB3OgaoYlhY8P/g8l4UawHfk
	ccmEWWd2xK57yCXMraHbpQyf+Ct5kFogJFsjqLOhVifxTRUPTgECLTxOVzO43UCiVj3pCg
	9XT3/Xd9vkWrdHsTeCjaM9lwFrlYqt8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-6TUQvUE0MpW9uAO31dot3g-1; Sat, 21 Jan 2023 06:53:29 -0500
X-MC-Unique: 6TUQvUE0MpW9uAO31dot3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20E271869B6D;
	Sat, 21 Jan 2023 11:53:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9812A2166B2A;
	Sat, 21 Jan 2023 11:53:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4282C1946597;
	Sat, 21 Jan 2023 11:53:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 78A781946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 21 Jan 2023 11:53:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3858C492B03; Sat, 21 Jan 2023 11:53:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30893492B02
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 11:53:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 109868533A2
 for <cluster-devel@redhat.com>; Sat, 21 Jan 2023 11:53:25 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-CzcRg4BIPIGLXZpz1n6SWA-1; Sat, 21 Jan 2023 06:53:23 -0500
X-MC-Unique: CzcRg4BIPIGLXZpz1n6SWA-1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="309353728"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="309353728"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2023 03:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="610768753"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="610768753"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 21 Jan 2023 03:53:17 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pJCQv-00041S-0Y;
 Sat, 21 Jan 2023 11:53:17 +0000
Date: Sat, 21 Jan 2023 19:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Message-ID: <202301211944.5T9l1RgA-lkp@intel.com>
References: <20230121065755.1140136-8-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230121065755.1140136-8-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 7/7] mm: return an ERR_PTR from
 __filemap_get_folio
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 llvm@lists.linux.dev, cluster-devel@redhat.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20230120]
[cannot apply to akpm-mm/mm-everything tytso-ext4/dev kdave/for-next xfs-linux/for-next konis-nilfs2/upstream linus/master v6.2-rc4 v6.2-rc3 v6.2-rc2 v6.2-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/mm-make-mapping_get_entry-available-outside-of-filemap-c/20230121-155847
patch link:    https://lore.kernel.org/r/20230121065755.1140136-8-hch%40lst.de
patch subject: [PATCH 7/7] mm: return an ERR_PTR from __filemap_get_folio
config: riscv-randconfig-r013-20230119 (https://download.01.org/0day-ci/archive/20230121/202301211944.5T9l1RgA-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3c8a98fd03b82ace84668b3f8bb48d48e9f34af2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christoph-Hellwig/mm-make-mapping_get_entry-available-outside-of-filemap-c/20230121-155847
        git checkout 3c8a98fd03b82ace84668b3f8bb48d48e9f34af2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/iomap/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/iomap/buffered-io.c:669:28: warning: variable 'folio' is uninitialized when used here [-Wuninitialized]
           if (pos + len > folio_pos(folio) + folio_size(folio))
                                     ^~~~~
   fs/iomap/buffered-io.c:636:21: note: initialize the variable 'folio' to silence this warning
           struct folio *folio;
                              ^
                               = NULL
   fs/iomap/buffered-io.c:598:22: warning: unused function '__iomap_get_folio' [-Wunused-function]
   static struct folio *__iomap_get_folio(struct iomap_iter *iter, loff_t pos,
                        ^
   2 warnings generated.


vim +/folio +669 fs/iomap/buffered-io.c

69f4a26c1e0c7c Gao Xiang               2021-08-03  630  
d7b64041164ca1 Dave Chinner            2022-11-29  631  static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  632) 		size_t len, struct folio **foliop)
afc51aaa22f26c Darrick J. Wong         2019-07-15  633  {
471859f57d4253 Andreas Gruenbacher     2023-01-15  634  	const struct iomap_folio_ops *folio_ops = iter->iomap.folio_ops;
fad0a1ab34f777 Christoph Hellwig       2021-08-10  635  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
d1bd0b4ebfe052 Matthew Wilcox (Oracle  2021-11-03  636) 	struct folio *folio;
afc51aaa22f26c Darrick J. Wong         2019-07-15  637  	int status = 0;
afc51aaa22f26c Darrick J. Wong         2019-07-15  638  
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  639  	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  640  	if (srcmap != &iter->iomap)
c039b997927263 Goldwyn Rodrigues       2019-10-18  641  		BUG_ON(pos + len > srcmap->offset + srcmap->length);
afc51aaa22f26c Darrick J. Wong         2019-07-15  642  
afc51aaa22f26c Darrick J. Wong         2019-07-15  643  	if (fatal_signal_pending(current))
afc51aaa22f26c Darrick J. Wong         2019-07-15  644  		return -EINTR;
afc51aaa22f26c Darrick J. Wong         2019-07-15  645  
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  646) 	if (!mapping_large_folio_support(iter->inode->i_mapping))
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  647) 		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  648) 
d7b64041164ca1 Dave Chinner            2022-11-29  649  	/*
d7b64041164ca1 Dave Chinner            2022-11-29  650  	 * Now we have a locked folio, before we do anything with it we need to
d7b64041164ca1 Dave Chinner            2022-11-29  651  	 * check that the iomap we have cached is not stale. The inode extent
d7b64041164ca1 Dave Chinner            2022-11-29  652  	 * mapping can change due to concurrent IO in flight (e.g.
d7b64041164ca1 Dave Chinner            2022-11-29  653  	 * IOMAP_UNWRITTEN state can change and memory reclaim could have
d7b64041164ca1 Dave Chinner            2022-11-29  654  	 * reclaimed a previously partially written page at this index after IO
d7b64041164ca1 Dave Chinner            2022-11-29  655  	 * completion before this write reaches this file offset) and hence we
d7b64041164ca1 Dave Chinner            2022-11-29  656  	 * could do the wrong thing here (zero a page range incorrectly or fail
d7b64041164ca1 Dave Chinner            2022-11-29  657  	 * to zero) and corrupt data.
d7b64041164ca1 Dave Chinner            2022-11-29  658  	 */
471859f57d4253 Andreas Gruenbacher     2023-01-15  659  	if (folio_ops && folio_ops->iomap_valid) {
471859f57d4253 Andreas Gruenbacher     2023-01-15  660  		bool iomap_valid = folio_ops->iomap_valid(iter->inode,
d7b64041164ca1 Dave Chinner            2022-11-29  661  							 &iter->iomap);
d7b64041164ca1 Dave Chinner            2022-11-29  662  		if (!iomap_valid) {
d7b64041164ca1 Dave Chinner            2022-11-29  663  			iter->iomap.flags |= IOMAP_F_STALE;
d7b64041164ca1 Dave Chinner            2022-11-29  664  			status = 0;
d7b64041164ca1 Dave Chinner            2022-11-29  665  			goto out_unlock;
d7b64041164ca1 Dave Chinner            2022-11-29  666  		}
d7b64041164ca1 Dave Chinner            2022-11-29  667  	}
d7b64041164ca1 Dave Chinner            2022-11-29  668  
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09 @669) 	if (pos + len > folio_pos(folio) + folio_size(folio))
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  670) 		len = folio_pos(folio) + folio_size(folio) - pos;
afc51aaa22f26c Darrick J. Wong         2019-07-15  671  
c039b997927263 Goldwyn Rodrigues       2019-10-18  672  	if (srcmap->type == IOMAP_INLINE)
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  673) 		status = iomap_write_begin_inline(iter, folio);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  674  	else if (srcmap->flags & IOMAP_F_BUFFER_HEAD)
d1bd0b4ebfe052 Matthew Wilcox (Oracle  2021-11-03  675) 		status = __block_write_begin_int(folio, pos, len, NULL, srcmap);
afc51aaa22f26c Darrick J. Wong         2019-07-15  676  	else
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  677) 		status = __iomap_write_begin(iter, pos, len, folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  678  
afc51aaa22f26c Darrick J. Wong         2019-07-15  679  	if (unlikely(status))
afc51aaa22f26c Darrick J. Wong         2019-07-15  680  		goto out_unlock;
afc51aaa22f26c Darrick J. Wong         2019-07-15  681  
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  682) 	*foliop = folio;
afc51aaa22f26c Darrick J. Wong         2019-07-15  683  	return 0;
afc51aaa22f26c Darrick J. Wong         2019-07-15  684  
afc51aaa22f26c Darrick J. Wong         2019-07-15  685  out_unlock:
7a70a5085ed028 Andreas Gruenbacher     2023-01-15  686  	__iomap_put_folio(iter, pos, 0, folio);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  687  	iomap_write_failed(iter->inode, pos, len);
afc51aaa22f26c Darrick J. Wong         2019-07-15  688  
afc51aaa22f26c Darrick J. Wong         2019-07-15  689  	return status;
afc51aaa22f26c Darrick J. Wong         2019-07-15  690  }
afc51aaa22f26c Darrick J. Wong         2019-07-15  691  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

