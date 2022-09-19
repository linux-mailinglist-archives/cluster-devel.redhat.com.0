Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5C95BD3CE
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Sep 2022 19:35:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663608900;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kdS9QD9VodJFlDe/hzPt/fIHrfeguLlK063E4oft3xY=;
	b=UeUoFUunt02tlMAdLABl6jabraMGJi2aEnYrfNuvC2FMLCmrpzbUAEQtoa3SlIgzblTStY
	QAFzks85D3iOz0eofW6+tLYtF8q6DM99Tgmc2b9cFYXC8f/cwQ9GIoWDnTuTELkXMe6ADk
	aJ1prJre3+CkyOuTJIEA0VbsoLw51p8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-pUsFcNw5NUmSApmeQhisEA-1; Mon, 19 Sep 2022 13:34:57 -0400
X-MC-Unique: pUsFcNw5NUmSApmeQhisEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AAB1855304;
	Mon, 19 Sep 2022 17:34:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E439940C2064;
	Mon, 19 Sep 2022 17:34:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AEF9B19465A4;
	Mon, 19 Sep 2022 17:34:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9BC7819465A0 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 19 Sep 2022 17:34:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8CDD2492B06; Mon, 19 Sep 2022 17:34:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85156492B05
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 17:34:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A4AF29AB45D
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 17:34:54 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-hgnacyncMjaRS1d3vPhjfw-1; Mon, 19 Sep 2022 13:34:52 -0400
X-MC-Unique: hgnacyncMjaRS1d3vPhjfw-1
Received: by mail-ot1-f42.google.com with SMTP id
 r22-20020a9d7516000000b00659ef017e34so7452otk.13
 for <cluster-devel@redhat.com>; Mon, 19 Sep 2022 10:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kdS9QD9VodJFlDe/hzPt/fIHrfeguLlK063E4oft3xY=;
 b=DNJII79ED2YX3ThXaaS85FY3AE9rRNynuREMMuCmZ2awKU+UOm1Ek/pdXEUAo08+Zh
 IgAcoC0inmwhBMZgE1SrmxKqVNLbuTh/P0B7chD8BV/KxQQXZJ3ZiEufAIKTVpueRtpE
 V3OA+MF+MpZ9MjFbLgqS8p1+lmZ0kpNTH8IC1F5WA2MD19OSWzpbjMmPjDLkasMMsuov
 0rXce08Z3YgrSQMoGeL4S+LP0nzi1FgFECckEy3kMWc/Bf1b1oUZnj1HIWqUcrYgPAJb
 1kYOiEMP5ItDaEjr9oKMqP5lFNjX420f/GDuq72Td0ZcpEHEZL7YtUNFAxY/5kgxyOVq
 5KtQ==
X-Gm-Message-State: ACrzQf3pHMWwX2HyAomVRYIxvBjOO9wq0m5QMGoZbwN2XMm4aGbf00yo
 skfsIJzCnI30c5p690KrvKm1jMBfTeTLQ3n1/wE=
X-Google-Smtp-Source: AMsMyM5sQYgUol/jmTSw3stKiJsYQ02a9vmJcS7x25EvIWll4MwqWjrE0KfujNT4rW/qZrnmuFrh2hzLLcoYzG7yGfA=
X-Received: by 2002:a05:6830:d8c:b0:639:6034:b3d7 with SMTP id
 bv12-20020a0568300d8c00b006396034b3d7mr8692869otb.125.1663608892048; Mon, 19
 Sep 2022 10:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220912182224.514561-1-vishal.moola@gmail.com>
In-Reply-To: <20220912182224.514561-1-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 19 Sep 2022 10:34:40 -0700
Message-ID: <CAOzc2pznw0qp3xVm98-TdU=JBVxintYN1Q4Ci9qTQkBYRxi9QQ@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v2 00/23] Convert to
 filemap_get_folios_tag()
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 12, 2022 at 11:25 AM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> This patch series replaces find_get_pages_range_tag() with
> filemap_get_folios_tag(). This also allows the removal of multiple
> calls to compound_head() throughout.
> It also makes a good chunk of the straightforward conversions to folios,
> and takes the opportunity to introduce a function that grabs a folio
> from the pagecache.
>
> F2fs and Ceph have quite alot of work to be done regarding folios, so
> for now those patches only have the changes necessary for the removal of
> find_get_pages_range_tag(), and only support folios of size 1 (which is
> all they use right now anyways).
>
> I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> beneficial. The page-writeback and filemap changes implicitly work. Testing
> and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.
> ---
> v2:
>   Got Acked-By tags for nilfs and btrfs changes
>   Fixed an error arising in f2fs
>   - Reported-by: kernel test robot <lkp@intel.com>
>
> Vishal Moola (Oracle) (23):
>   pagemap: Add filemap_grab_folio()
>   filemap: Added filemap_get_folios_tag()
>   filemap: Convert __filemap_fdatawait_range() to use
>     filemap_get_folios_tag()
>   page-writeback: Convert write_cache_pages() to use
>     filemap_get_folios_tag()
>   afs: Convert afs_writepages_region() to use filemap_get_folios_tag()
>   btrfs: Convert btree_write_cache_pages() to use
>     filemap_get_folio_tag()
>   btrfs: Convert extent_write_cache_pages() to use
>     filemap_get_folios_tag()
>   ceph: Convert ceph_writepages_start() to use filemap_get_folios_tag()
>   cifs: Convert wdata_alloc_and_fillpages() to use
>     filemap_get_folios_tag()
>   ext4: Convert mpage_prepare_extent_to_map() to use
>     filemap_get_folios_tag()
>   f2fs: Convert f2fs_fsync_node_pages() to use filemap_get_folios_tag()
>   f2fs: Convert f2fs_flush_inline_data() to use filemap_get_folios_tag()
>   f2fs: Convert f2fs_sync_node_pages() to use filemap_get_folios_tag()
>   f2fs: Convert f2fs_write_cache_pages() to use filemap_get_folios_tag()
>   f2fs: Convert last_fsync_dnode() to use filemap_get_folios_tag()
>   f2fs: Convert f2fs_sync_meta_pages() to use filemap_get_folios_tag()
>   gfs2: Convert gfs2_write_cache_jdata() to use filemap_get_folios_tag()
>   nilfs2: Convert nilfs_lookup_dirty_data_buffers() to use
>     filemap_get_folios_tag()
>   nilfs2: Convert nilfs_lookup_dirty_node_buffers() to use
>     filemap_get_folios_tag()
>   nilfs2: Convert nilfs_btree_lookup_dirty_buffers() to use
>     filemap_get_folios_tag()
>   nilfs2: Convert nilfs_copy_dirty_pages() to use
>     filemap_get_folios_tag()
>   nilfs2: Convert nilfs_clear_dirty_pages() to use
>     filemap_get_folios_tag()
>   filemap: Remove find_get_pages_range_tag()
>
>  fs/afs/write.c          | 114 +++++++++++++++++----------------
>  fs/btrfs/extent_io.c    |  57 +++++++++--------
>  fs/ceph/addr.c          | 138 ++++++++++++++++++++--------------------
>  fs/cifs/file.c          |  33 +++++++++-
>  fs/ext4/inode.c         |  55 ++++++++--------
>  fs/f2fs/checkpoint.c    |  49 +++++++-------
>  fs/f2fs/compress.c      |  13 ++--
>  fs/f2fs/data.c          |  69 ++++++++++----------
>  fs/f2fs/f2fs.h          |   5 +-
>  fs/f2fs/node.c          |  72 +++++++++++----------
>  fs/gfs2/aops.c          |  64 ++++++++++---------
>  fs/nilfs2/btree.c       |  14 ++--
>  fs/nilfs2/page.c        |  59 ++++++++---------
>  fs/nilfs2/segment.c     |  44 +++++++------
>  include/linux/pagemap.h |  32 +++++++---
>  include/linux/pagevec.h |   8 ---
>  mm/filemap.c            |  87 ++++++++++++-------------
>  mm/page-writeback.c     |  44 +++++++------
>  mm/swap.c               |  10 ---
>  19 files changed, 507 insertions(+), 460 deletions(-)
>
> --
> 2.36.1
>

Just following up on these patches. Many of the changes still need review.
If anyone has time this week to look over any of the affected areas (pagecache,
afs, ceph, ciph, ext4, f2fs, or gfs) feedback would be much appreciated.

Also, Thanks to David for looking at btrfs and Ryusuke for looking at
nilfs already.

