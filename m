Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B81749296
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Jul 2023 02:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688603104;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mSeqrkSy8pFB7QXrChoA9L68JfH59QZ2Jmly9DHoUhU=;
	b=JbgDNq2q9qKgWLXLEW3X95RTMiWxyW+UWI5loAnHqafP3NKelUfnFZ8F+P5TcYx/foOOlk
	CFkgn1QMTohItmGQv/MkTLfed8qkxl+l3xoIsyHoBOyKFD1NAasjZO85qU+PR0FzWe3vhS
	BgX8XT+hNTraefVBQYWLn1O0WXEcf9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-WDxxspMeMxOeeMqkuyuPgw-1; Wed, 05 Jul 2023 20:25:00 -0400
X-MC-Unique: WDxxspMeMxOeeMqkuyuPgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08285101A54E;
	Thu,  6 Jul 2023 00:25:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF3111121314;
	Thu,  6 Jul 2023 00:24:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B9FB019465A0;
	Thu,  6 Jul 2023 00:24:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4DC081946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 31E39207B2DF; Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ABD9207B2DD
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 106C21C05144
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-gx_AoTzAO0CFF5JCP4WLKQ-1; Wed, 05 Jul 2023 20:24:53 -0400
X-MC-Unique: gx_AoTzAO0CFF5JCP4WLKQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2134A61812;
 Thu,  6 Jul 2023 00:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3203C433D9;
 Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C19C0C0C40E; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269478.29151.608883953593901827.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230519093521.133226-2-hch@lst.de>
In-Reply-To: <20230519093521.133226-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH 01/13] iomap: update ki_pos a
 little later in iomap_dio_complete
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
Cc: djwong@kernel.org, linux-mm@kvack.org, miklos@szeredi.hu,
 willy@infradead.org, cluster-devel@redhat.com, idryomov@gmail.com,
 linux-ext4@vger.kernel.org, brauner@kernel.org, linux-block@vger.kernel.org,
 dlemoal@kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, xiubli@redhat.com, trond.myklebust@hammerspace.com,
 axboe@kernel.dk, linux-nfs@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 anna@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Fri, 19 May 2023 11:35:09 +0200 you wrote:
> Move the ki_pos update down a bit to prepare for a better common
> helper that invalidates pages based of an iocb.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/direct-io.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Here is the summary with links:
  - [f2fs-dev,01/13] iomap: update ki_pos a little later in iomap_dio_compl=
ete
    https://git.kernel.org/jaegeuk/f2fs/c/936e114a245b
  - [f2fs-dev,02/13] filemap: update ki_pos in generic_perform_write
    (no matching commit)
  - [f2fs-dev,03/13] filemap: assign current->backing_dev_info in generic_p=
erform_write
    (no matching commit)
  - [f2fs-dev,04/13] filemap: add a kiocb_write_and_wait helper
    https://git.kernel.org/jaegeuk/f2fs/c/3c435a0fe35c
  - [f2fs-dev,05/13] filemap: add a kiocb_invalidate_pages helper
    https://git.kernel.org/jaegeuk/f2fs/c/e003f74afbd2
  - [f2fs-dev,06/13] filemap: add a kiocb_invalidate_post_write helper
    (no matching commit)
  - [f2fs-dev,07/13] iomap: update ki_pos in iomap_file_buffered_write
    (no matching commit)
  - [f2fs-dev,08/13] iomap: assign current->backing_dev_info in iomap_file_=
buffered_write
    (no matching commit)
  - [f2fs-dev,09/13] iomap: use kiocb_write_and_wait and kiocb_invalidate_p=
ages
    https://git.kernel.org/jaegeuk/f2fs/c/8ee93b4bb626
  - [f2fs-dev,10/13] fs: factor out a direct_write_fallback helper
    (no matching commit)
  - [f2fs-dev,11/13] fuse: update ki_pos in fuse_perform_write
    (no matching commit)
  - [f2fs-dev,12/13] fuse: drop redundant arguments to fuse_perform_write
    (no matching commit)
  - [f2fs-dev,13/13] fuse: use direct_write_fallback
    (no matching commit)

You are awesome, thank you!
--=20
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


