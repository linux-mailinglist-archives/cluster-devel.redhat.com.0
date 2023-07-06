Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2250749294
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Jul 2023 02:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688603103;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3960aT6pOip3YwwYSaZVAoAMKs72BxtB5xXzRZJFDic=;
	b=D0T+Bh1vVYs+5qQmmV1E0kkUyvPTmm5ZA1Sy4ejorVuw0RZnTxLd/2T1oV12kXCAwOIz7F
	86qEF+X2+F0/m+xGAz2Y4Jp3gBBJHbotpP2ySBihDlU8Oylvbl9Z+eyOIpQoefa1msBCkM
	03enO/+5eWlKXxwyZk+Yk4N43SaYmmQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-wv5RICJWN3-ylSgTPZd60g-1; Wed, 05 Jul 2023 20:25:00 -0400
X-MC-Unique: wv5RICJWN3-ylSgTPZd60g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B5D3800CAE;
	Thu,  6 Jul 2023 00:24:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25F434CD0C8;
	Thu,  6 Jul 2023 00:24:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC9951946594;
	Thu,  6 Jul 2023 00:24:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 912A71946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Jul 2023 00:24:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CBB31121315; Thu,  6 Jul 2023 00:24:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 754C31121314
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 00:24:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59C88800159
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 00:24:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-_AfOaVSCNH6YUivslUshCw-1; Wed, 05 Jul 2023 20:24:54 -0400
X-MC-Unique: _AfOaVSCNH6YUivslUshCw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84E1F61785;
 Thu,  6 Jul 2023 00:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2605C433CB;
 Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B0483C561EE; Thu,  6 Jul 2023 00:18:14 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168860269470.29151.2457227220614428868.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jul 2023 00:18:14 +0000
References: <20230424054926.26927-2-hch@lst.de>
In-Reply-To: <20230424054926.26927-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [f2fs-dev] [PATCH 01/17] fs: unexport
 buffer_check_dirty_writeback
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
Cc: axboe@kernel.dk, cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 miklos@szeredi.hu, djwong@kernel.org, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dhowells@redhat.com, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jens Axboe <axboe@kernel.dk>:

On Mon, 24 Apr 2023 07:49:10 +0200 you wrote:
> buffer_check_dirty_writeback is only used by the block device aops,
> remove the export.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/buffer.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,01/17] fs: unexport buffer_check_dirty_writeback
    https://git.kernel.org/jaegeuk/f2fs/c/4bb218a65a43
  - [f2fs-dev,02/17] fs: remove the special !CONFIG_BLOCK def_blk_fops
    https://git.kernel.org/jaegeuk/f2fs/c/bda2795a630b
  - [f2fs-dev,03/17] fs: rename and move block_page_mkwrite_return
    (no matching commit)
  - [f2fs-dev,04/17] fs: remove emergency_thaw_bdev
    (no matching commit)
  - [f2fs-dev,05/17] filemap: update ki_pos in generic_perform_write
    (no matching commit)
  - [f2fs-dev,06/17] filemap: add a kiocb_write_and_wait helper
    https://git.kernel.org/jaegeuk/f2fs/c/3c435a0fe35c
  - [f2fs-dev,07/17] filemap: add a kiocb_invalidate_pages helper
    https://git.kernel.org/jaegeuk/f2fs/c/e003f74afbd2
  - [f2fs-dev,08/17] filemap: add a kiocb_invalidate_post_write helper
    (no matching commit)
  - [f2fs-dev,09/17] fs: factor out a direct_write_fallback helper
    (no matching commit)
  - [f2fs-dev,10/17] iomap: use kiocb_write_and_wait and kiocb_invalidate_p=
ages
    (no matching commit)
  - [f2fs-dev,11/17] iomap: assign current->backing_dev_info in iomap_file_=
buffered_write
    (no matching commit)
  - [f2fs-dev,12/17] fuse: use direct_write_fallback
    (no matching commit)
  - [f2fs-dev,13/17] block: don't plug in blkdev_write_iter
    https://git.kernel.org/jaegeuk/f2fs/c/712c7364655f
  - [f2fs-dev,14/17] block: open code __generic_file_write_iter for blkdev =
writes
    (no matching commit)
  - [f2fs-dev,15/17] block: stop setting ->direct_IO
    (no matching commit)
  - [f2fs-dev,16/17] block: use iomap for writes to block devices
    (no matching commit)
  - [f2fs-dev,17/17] fs: add CONFIG_BUFFER_HEAD
    (no matching commit)

You are awesome, thank you!
--=20
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


