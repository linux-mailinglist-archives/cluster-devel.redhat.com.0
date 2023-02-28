Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2F46A56D4
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Feb 2023 11:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677580433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5ifL5SZ/I3Sdxd72VYXzJVOeEQi3WhgwyTlSi8fWm0I=;
	b=LyVoJmwZy4gkeu3JkTqGTmQ/hU8Lfvch9zZJhsiwuabMWdXwdhskYeo15ptTY1+OqDQH6W
	8D+4GlG1ppdKqdWE06uWEVaijbMUPw2mU39dB6FO0o0H48rrlLt4FI9Rbnyt0x6KdwVvPL
	2IXwFTYKdTMXbXurRF7rZ7Vef+a3p/o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-kKj70bJDPxOkxuVkiAi2tg-1; Tue, 28 Feb 2023 05:33:50 -0500
X-MC-Unique: kKj70bJDPxOkxuVkiAi2tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EB553C11A0F;
	Tue, 28 Feb 2023 10:33:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64B152166B26;
	Tue, 28 Feb 2023 10:33:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21ECC194658F;
	Tue, 28 Feb 2023 10:33:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1053C1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Feb 2023 01:08:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5574140EBF6; Tue, 28 Feb 2023 01:08:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD28A140EBF4
 for <cluster-devel@redhat.com>; Tue, 28 Feb 2023 01:08:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C146D1C05ABC
 for <cluster-devel@redhat.com>; Tue, 28 Feb 2023 01:08:39 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-QwToXXyUOAqh1pvqNOq-Qw-1; Mon, 27 Feb 2023 20:08:38 -0500
X-MC-Unique: QwToXXyUOAqh1pvqNOq-Qw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5743B80DD6;
 Tue, 28 Feb 2023 01:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A490C4339B;
 Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ED819C41676; Tue, 28 Feb 2023 01:01:54 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167754611496.27916.17463541946406622753.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 01:01:54 +0000
References: <20230104211448.4804-1-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
To: Vishal Moola (Oracle) <vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 28 Feb 2023 10:33:46 +0000
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH v5 00/23] Convert to
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
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed,  4 Jan 2023 13:14:25 -0800 you wrote:
> This patch series replaces find_get_pages_range_tag() with
> filemap_get_folios_tag(). This also allows the removal of multiple
> calls to compound_head() throughout.
> It also makes a good chunk of the straightforward conversions to folios,
> and takes the opportunity to introduce a function that grabs a folio
> from the pagecache.
>=20
> [...]

Here is the summary with links:
  - [f2fs-dev,v5,01/23] pagemap: Add filemap_grab_folio()
    https://git.kernel.org/jaegeuk/f2fs/c/ee7a5906ff08
  - [f2fs-dev,v5,02/23] filemap: Added filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/247f9e1feef4
  - [f2fs-dev,v5,03/23] filemap: Convert __filemap_fdatawait_range() to use=
 filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/6817ef514e1a
  - [f2fs-dev,v5,04/23] page-writeback: Convert write_cache_pages() to use =
filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/0fff435f060c
  - [f2fs-dev,v5,05/23] afs: Convert afs_writepages_region() to use filemap=
_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/acc8d8588cb7
  - [f2fs-dev,v5,06/23] btrfs: Convert btree_write_cache_pages() to use fil=
emap_get_folio_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/51c5cd3bafe5
  - [f2fs-dev,v5,07/23] btrfs: Convert extent_write_cache_pages() to use fi=
lemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/9f50fd2e92e3
  - [f2fs-dev,v5,08/23] ceph: Convert ceph_writepages_start() to use filema=
p_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/590a2b5f0a9b
  - [f2fs-dev,v5,09/23] cifs: Convert wdata_alloc_and_fillpages() to use fi=
lemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/4cda80f3a7a5
  - [f2fs-dev,v5,10/23] ext4: Convert mpage_prepare_extent_to_map() to use =
filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/50ead2537441
  - [f2fs-dev,v5,11/23] f2fs: Convert f2fs_fsync_node_pages() to use filema=
p_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/e6e46e1eb7ce
  - [f2fs-dev,v5,12/23] f2fs: Convert f2fs_flush_inline_data() to use filem=
ap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/a40a4ad1186a
  - [f2fs-dev,v5,13/23] f2fs: Convert f2fs_sync_node_pages() to use filemap=
_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/7525486affa5
  - [f2fs-dev,v5,14/23] f2fs: Convert f2fs_write_cache_pages() to use filem=
ap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/1cd98ee747cf
  - [f2fs-dev,v5,15/23] f2fs: Convert last_fsync_dnode() to use filemap_get=
_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/4f4a4f0febe6
  - [f2fs-dev,v5,16/23] f2fs: Convert f2fs_sync_meta_pages() to use filemap=
_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/580e7a492608
  - [f2fs-dev,v5,17/23] gfs2: Convert gfs2_write_cache_jdata() to use filem=
ap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/87ed37e66dfd
  - [f2fs-dev,v5,18/23] nilfs2: Convert nilfs_lookup_dirty_data_buffers() t=
o use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/5ee4b25cb730
  - [f2fs-dev,v5,19/23] nilfs2: Convert nilfs_lookup_dirty_node_buffers() t=
o use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/a24586583169
  - [f2fs-dev,v5,20/23] nilfs2: Convert nilfs_btree_lookup_dirty_buffers() =
to use filemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/41f3f3b5373e
  - [f2fs-dev,v5,21/23] nilfs2: Convert nilfs_copy_dirty_pages() to use fil=
emap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/d4a16d31334e
  - [f2fs-dev,v5,22/23] nilfs2: Convert nilfs_clear_dirty_pages() to use fi=
lemap_get_folios_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/243c5ea4f783
  - [f2fs-dev,v5,23/23] filemap: Remove find_get_pages_range_tag()
    https://git.kernel.org/jaegeuk/f2fs/c/c5792d938411

You are awesome, thank you!
--=20
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


