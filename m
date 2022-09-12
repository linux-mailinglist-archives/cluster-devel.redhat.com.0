Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96B5B6020
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Sep 2022 20:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663007133;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jinrTf2dRXCM8P7beDGhcdymXhWilSgCNRAiFQeNJHI=;
	b=gmAAqRzJTRWSmi7bcxWzBLEa7MTnQmuusLYajFkAvaa2QbUDifc7vcjmxQpyrv2U1o0cHU
	5tO9cCuciQet2MpSPMyI1TD7ilqtdPUCb1CRVMuulBtAnU2NEGZijA87ih3OGVJFA8b6R6
	0H0JnQ0jEd6PegOA0yyA64VUTjuCuv0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-REqzPUEEMsit4Si-E_DMVQ-1; Mon, 12 Sep 2022 14:25:28 -0400
X-MC-Unique: REqzPUEEMsit4Si-E_DMVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E35585A589;
	Mon, 12 Sep 2022 18:25:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79D781121314;
	Mon, 12 Sep 2022 18:25:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E42D1946A49;
	Mon, 12 Sep 2022 18:25:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 726261946A43 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Sep 2022 18:25:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 659282166B29; Mon, 12 Sep 2022 18:25:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61E992166B26
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:25:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 230EB18188A0
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:25:26 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-pjoMy2miOlmbDCLc_M6l2w-1; Mon, 12 Sep 2022 14:25:21 -0400
X-MC-Unique: pjoMy2miOlmbDCLc_M6l2w-1
Received: by mail-pj1-f43.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so13185088pjq.3
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 11:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=jinrTf2dRXCM8P7beDGhcdymXhWilSgCNRAiFQeNJHI=;
 b=yVaYEcHaLS3nOFAHiEi8gLJxAc9ppQ81DGwtStlDVG4jpHd/2dbQ3R2fieBYjSgQEy
 +9uBR+/RBTffrYSNMU/7akVLnxGuvL6KLJAhe9iWiSVbg3g6cy83WH2YAqCw8V7wtPw8
 805ac+agK6Qqg/r0LmaXKZO0mhL7Lk0BK5RnEvkd4iDQ+E8PPVg1oX462uuUJ2BtyQHB
 6TUD5X+OiIhx1U/wok847KVgn35yIOm33aGDh4ZqlrZ08cWBTYtsLuJkihQxPrrBKQvw
 +X0FnimlTxak+RDeUGioD2yQs95aSpdxt6oNyHlHKlKkZ7j8xL43U0cZrpBKkyQkLt5j
 iY7A==
X-Gm-Message-State: ACgBeo3idoJ6Fxi6/3qaAsCxBK0Nk/G3Xw2W8VT7OkaA78yjlNfCSOq3
 5t5Um+S4kKTvGVRgmN4cXMI=
X-Google-Smtp-Source: AA6agR7TErEeniLb8NygdX/YotrQEVmapgtPdEtpEWF/iOvuOSsfvdyhlVfrcnUmKBhBkPJIGioMFA==
X-Received: by 2002:a17:90b:180e:b0:202:a0c3:6da with SMTP id
 lw14-20020a17090b180e00b00202a0c306damr14093608pjb.94.1663007120382; 
 Mon, 12 Sep 2022 11:25:20 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:19 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:01 -0700
Message-Id: <20220912182224.514561-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v2 00/23] Convert to filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch series replaces find_get_pages_range_tag() with
filemap_get_folios_tag(). This also allows the removal of multiple
calls to compound_head() throughout.
It also makes a good chunk of the straightforward conversions to folios,
and takes the opportunity to introduce a function that grabs a folio
from the pagecache.

F2fs and Ceph have quite alot of work to be done regarding folios, so
for now those patches only have the changes necessary for the removal of
find_get_pages_range_tag(), and only support folios of size 1 (which is
all they use right now anyways).

I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
beneficial. The page-writeback and filemap changes implicitly work. Testing
and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.
---
v2:
  Got Acked-By tags for nilfs and btrfs changes
  Fixed an error arising in f2fs
  - Reported-by: kernel test robot <lkp@intel.com>
   
Vishal Moola (Oracle) (23):
  pagemap: Add filemap_grab_folio()
  filemap: Added filemap_get_folios_tag()
  filemap: Convert __filemap_fdatawait_range() to use
    filemap_get_folios_tag()
  page-writeback: Convert write_cache_pages() to use
    filemap_get_folios_tag()
  afs: Convert afs_writepages_region() to use filemap_get_folios_tag()
  btrfs: Convert btree_write_cache_pages() to use
    filemap_get_folio_tag()
  btrfs: Convert extent_write_cache_pages() to use
    filemap_get_folios_tag()
  ceph: Convert ceph_writepages_start() to use filemap_get_folios_tag()
  cifs: Convert wdata_alloc_and_fillpages() to use
    filemap_get_folios_tag()
  ext4: Convert mpage_prepare_extent_to_map() to use
    filemap_get_folios_tag()
  f2fs: Convert f2fs_fsync_node_pages() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_flush_inline_data() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_sync_node_pages() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_write_cache_pages() to use filemap_get_folios_tag()
  f2fs: Convert last_fsync_dnode() to use filemap_get_folios_tag()
  f2fs: Convert f2fs_sync_meta_pages() to use filemap_get_folios_tag()
  gfs2: Convert gfs2_write_cache_jdata() to use filemap_get_folios_tag()
  nilfs2: Convert nilfs_lookup_dirty_data_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_lookup_dirty_node_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_btree_lookup_dirty_buffers() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_copy_dirty_pages() to use
    filemap_get_folios_tag()
  nilfs2: Convert nilfs_clear_dirty_pages() to use
    filemap_get_folios_tag()
  filemap: Remove find_get_pages_range_tag()

 fs/afs/write.c          | 114 +++++++++++++++++----------------
 fs/btrfs/extent_io.c    |  57 +++++++++--------
 fs/ceph/addr.c          | 138 ++++++++++++++++++++--------------------
 fs/cifs/file.c          |  33 +++++++++-
 fs/ext4/inode.c         |  55 ++++++++--------
 fs/f2fs/checkpoint.c    |  49 +++++++-------
 fs/f2fs/compress.c      |  13 ++--
 fs/f2fs/data.c          |  69 ++++++++++----------
 fs/f2fs/f2fs.h          |   5 +-
 fs/f2fs/node.c          |  72 +++++++++++----------
 fs/gfs2/aops.c          |  64 ++++++++++---------
 fs/nilfs2/btree.c       |  14 ++--
 fs/nilfs2/page.c        |  59 ++++++++---------
 fs/nilfs2/segment.c     |  44 +++++++------
 include/linux/pagemap.h |  32 +++++++---
 include/linux/pagevec.h |   8 ---
 mm/filemap.c            |  87 ++++++++++++-------------
 mm/page-writeback.c     |  44 +++++++------
 mm/swap.c               |  10 ---
 19 files changed, 507 insertions(+), 460 deletions(-)

-- 
2.36.1

