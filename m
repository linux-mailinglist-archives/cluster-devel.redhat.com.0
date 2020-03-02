Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 493B8175D95
	for <lists+cluster-devel@lfdr.de>; Mon,  2 Mar 2020 15:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583160763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JJZwjPW6YPmki+tQZfLxAAK1f6nD9R17i9IvBsoEZ5w=;
	b=NOktksTnCgAC2BIUmCrLTnOm+g/9N2+Ftz7V22x99sIWmoKwrMpJUvDuVucZ+GZPZkdOnA
	puu9qfE+JyA7KWvuW6T2KCHqd59v6I/dVbs1jk9Cmrdii2Ek8uWtHMx5S3De7k6bTOXeHs
	KXEAY+dKABQAIaJ1ntdfvxgjYnzY1cI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-k-EGBB3JNEKXVcFJocE2og-1; Mon, 02 Mar 2020 09:52:41 -0500
X-MC-Unique: k-EGBB3JNEKXVcFJocE2og-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4E558018A9;
	Mon,  2 Mar 2020 14:52:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E4290CC3;
	Mon,  2 Mar 2020 14:52:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD0CB8449D;
	Mon,  2 Mar 2020 14:52:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022EqWMe007778 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 09:52:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A0EA2038B80; Mon,  2 Mar 2020 14:52:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 053EB2038B82
	for <cluster-devel@redhat.com>; Mon,  2 Mar 2020 14:52:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA85D867B36
	for <cluster-devel@redhat.com>; Mon,  2 Mar 2020 14:52:29 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-AEa6TzP5PLCBrlorutBosA-1; Mon, 02 Mar 2020 09:52:28 -0500
X-MC-Unique: AEa6TzP5PLCBrlorutBosA-1
Received: by mail-oi1-f199.google.com with SMTP id e22so68411oig.1
	for <cluster-devel@redhat.com>; Mon, 02 Mar 2020 06:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VYVayJyPY4AiEnUL9/Tsxm90z3cAV8AjVDcjBsrZlkY=;
	b=jy4GJMeiaNQ1sV/2/nwRAP1N3vW1AySJE75OXvl8f+1aLGClDqLLuHE+pIKH0z7RuB
	e3iG4KCh0zXHkoVoNKd+AiHxcz9QZkZ49fPS0ZEVSN3nYctd6sfknzJ9Vncm7cTr6We6
	1d+SbqBd9njXEOPKuc7/UBMd91nlMp/PRGgXfZDOMHbBY1lk+lPk1Ic2IODlrPbuYYPf
	APwgYb4TLG6W935a3L9UjdBtPYmuupx6excL9lpxswHDqnPPfMpadktweOOK8M/0/1Y5
	DHlMUFxPJpgcLaftYgQqSTQnD2f8pO5h43JFWmvlIWLHUus7N6g+9U/n0vHWtlggKNAA
	MNVA==
X-Gm-Message-State: APjAAAXF9S6VUEVVnb9irlHX8KZwxQOolBNzKLWIbM34+6Uwll2Y9zFi
	C3d8RtN2bpJTM//avVz4gV5bjFjkHFrVCPeQ9tHoPBg8UfWG9+LIIChmPWsBrL2cqRGkJjs+gvR
	9DfhaeZtJsvQdN5lwc98RvJFBEOWuHR1dsu7Riw==
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr13737253otl.185.1583160747529;
	Mon, 02 Mar 2020 06:52:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqweW/duoWFTSNTEbTmyXFtkxDZ7Z6+WqUmcHBicGOctpkBUUZv2cfm3PaCtYi5qgkjBWzXNQFBPicQIBtsMnL0=
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr13737232otl.185.1583160747107;
	Mon, 02 Mar 2020 06:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20200228194728.1375940-1-rpeterso@redhat.com>
In-Reply-To: <20200228194728.1375940-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 2 Mar 2020 15:52:16 +0100
Message-ID: <CAHc6FU6Fsv88Qcr+mEFNV-shUL1cArCrh9vJjo1qqGz0=FZuHA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022EqWMe007778
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 0/2 v2] Clean up and fix quota data
 allocate and free
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 8:47 PM Bob Peterson <rpeterso@redhat.com> wrote:
>
> This patch set cleans up a recently discovered race between file close
> and chown. The problem was that file close would free the quota data
> structures attached to the in-core inode, but chown relied on them to
> exist. So if the timing of the close is wrong, the chown can result in
> kernel panic. The problem is easily recreated with this:
>
> On terminal session 1:
> while true; do chown test /mnt/gfs2/test; chown root /mnt/gfs2/test; done
>
> On terminal session 2:
> while true; do echo "a" > /mnt/gfs2/test; echo "b" > /mnt/gfs2/test;done
>
> This is version 2 of this patch set. The first patch hasn't changed from
> the previous patch #3. The second patch is new. Andreas pointed out that =
v1
> kept the memory for quota data allocated too long because it was not free=
d
> until evict. This version takes a completely different approach. It chang=
es
> the quota data structure to be policed by an atomic count of users.

That sounds better, but gfs2_qa_get / gfs2_qa_put is done under
i_rw_mutex, so qa_ref doesn't need to be an atomic.

> Instead of gfs2_qa_alloc, each user must instead gfs2_qa_get() which
> allocates the structure if necessary, and initializes its usage count to =
2.
> After gfs2_qa_get, callers must call a corresponding gfs2_qa_put().
> As before, a file close or evict will decrement the counter one last time
> from 1 to 0, and free the memory.

This reference counting scheme is bogus, though. It seems we want to
switch to grabbing a reference in gfs2_open_common when (file->f_mode
& FMODE_WRITE) and put that reference again in gfs2_release under that
same condition instead.

> This patch set has not had adequate testing and may require some more cha=
nges,
> although it does fix the scenario listed above. I just wanted to throw th=
is
> one out as an alternative to the last and see if people like it any bette=
r.
>
> Bob Peterson (2):
>   gfs2: eliminate gfs2_rsqa_alloc in favor of gfs2_qa_alloc
>   gfs2: Change inode qa_data to allow multiple users
>
>  fs/gfs2/acl.c    |  7 +++++--
>  fs/gfs2/bmap.c   |  2 +-
>  fs/gfs2/file.c   | 19 ++++++++++++------
>  fs/gfs2/incore.h |  1 +
>  fs/gfs2/inode.c  | 31 +++++++++++++++++------------
>  fs/gfs2/quota.c  | 51 +++++++++++++++++++++++++++++-------------------
>  fs/gfs2/quota.h  |  4 ++--
>  fs/gfs2/rgrp.c   | 12 +-----------
>  fs/gfs2/rgrp.h   |  1 -
>  fs/gfs2/super.c  |  2 ++
>  fs/gfs2/xattr.c  | 12 ++++++++----
>  11 files changed, 83 insertions(+), 59 deletions(-)
>
> --
> 2.24.1
>

Thanks,
Andreas


