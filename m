Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C9EAF13236A
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Jan 2020 11:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578392421;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YnXSbVQEL+Cd9GEVAF9pKoJ5GS1rzVISkPvM02oKa40=;
	b=WWIMje/RlIY3kS7I6qsqhcDGIaPertInZWAxhdnG5VEEcsyCIx/UFgUwBFe/ktTqBLtiMe
	IRbhwTcInY16k+5gUvCseeBRlaqGVfhw3t6iluuPrIlP297fHUpNvJnXnYMOc85VuwJMnm
	GImWrVW+MVIQTn34neialKK9Itzjp08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-dITAQGJ3MFOTb_x1bKhxBg-1; Tue, 07 Jan 2020 05:20:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D03D1005502;
	Tue,  7 Jan 2020 10:20:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC2389A84;
	Tue,  7 Jan 2020 10:19:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F71A81C68;
	Tue,  7 Jan 2020 10:19:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 007AJpSO013879 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 05:19:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D31932022AC8; Tue,  7 Jan 2020 10:19:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE9902022AC7
	for <cluster-devel@redhat.com>; Tue,  7 Jan 2020 10:19:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 980AF802A40
	for <cluster-devel@redhat.com>; Tue,  7 Jan 2020 10:19:47 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-98-dJgzMoNTPgeXR112PF3e5Q-1; Tue, 07 Jan 2020 05:19:46 -0500
Received: by mail-oi1-f198.google.com with SMTP id m7so380721oim.14
	for <cluster-devel@redhat.com>; Tue, 07 Jan 2020 02:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ErGfGdOsa9Q+o06RO+lfiaSjr0Y+cK+Pv5g7CXqoWiA=;
	b=Cz8U7GbHp6eEOdHvm6rJEyXiQ+W1F+eSPhAGXZkmZwlN0GAHhQlO04uY1dmHvRsKRt
	Ho7bQLUN59rf/spka1fgMZwy/4g1+RNb2DkhRqFY98R/TNURcebHS11XkH4vL+6agKoy
	4F0FIXmhPm4NuqMjQbzCzeSFVCclwEypp6meYQZ76xzXA5NR1fNttcA3nzu8sRq8SfOY
	T8q/ldx8FcbCjurKSQMHlrIFfOiocaRyIfT3Nh46kOIv9clXBNOuoXNkDyg8c3O6a0OL
	V+A07E8iqqtjQes4hEIkD9iI0Gnrc6szy/V9nXig2hkL2JoBVDGQNEbl3I8qyiw4ug/0
	2r8w==
X-Gm-Message-State: APjAAAXCbn9n3gqoue4FOUcsIxIC/RWt9/4hOd4nYDW56uFs/M7q3cj2
	CwktiFaNxXeO1qJUI0500Qg1GUlHncEAxoETuN6lGxvR+HkP0MGw8yRRYJUjaAHBxeWuUbIlb8y
	R/UqtWIozVcBAGThv/5BMiEDWKGahpc52w2UL1Q==
X-Received: by 2002:a9d:6f8c:: with SMTP id h12mr69683878otq.185.1578392385696;
	Tue, 07 Jan 2020 02:19:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxuXoub+CEgYLJfbvyzj5ZIliSJt5QlUG/Gv4FbNWPiuik+dIKc0/wHBCKxU7uEv+Yn58YEZGXtk/lg8rx5X00=
X-Received: by 2002:a9d:6f8c:: with SMTP id h12mr69683863otq.185.1578392385453;
	Tue, 07 Jan 2020 02:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20200103153123.402971-1-rpeterso@redhat.com>
In-Reply-To: <20200103153123.402971-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 7 Jan 2020 11:19:34 +0100
Message-ID: <CAHc6FU5FhYxeYw9q1Xfmbt7ghE_2FdGS6G7x10muzsHhMKjj5Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: dJgzMoNTPgeXR112PF3e5Q-1
X-MC-Unique: dITAQGJ3MFOTb_x1bKhxBg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 007AJpSO013879
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 0/6] gfs2: jdata transactions not
 reserving enough revokes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bob,

On Fri, Jan 3, 2020 at 4:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch set, several gfs2 functions failed to reserve enough
> revoke entries in the journal. Some examples:
>
> 1. gfs2_dinode_dealloc failed to reserve a revoke for the dinode
>    being deleted.

that sounds like a bug.

> 2. Any function that allocates dinodes with gfs2_alloc_blocks
>    should reserve a revoke because alloc_blocks will premptively
>    call trans_remove_revoke to make sure there isn't a pending revoke
>    for the new dinode.
> 3. Any function that potentially will unstuff a stuffed directory
>    needs to reserve a revoke because gfs2_unstuff_dinode calls
>    gfs2_trans_remove_revoke for the new journaled leaf block.

Removing revokes doesn't require any space in the journal, so why
should we need to reserve space in that case?

> In addition, function gfs2_trans_remove_revoke unconditionally
> decrements tr->tr_num_revoke, and if not enough revokes are reserved, the
> value goes from 0 to  4294967295 (-1, but it's an unsigned int). This is =
later
> re-added to the system-wide revoke numbers, thereby decrementing the valu=
e
> (sd_log_commited_revoke) "properly," but by accident. This worked properl=
y
> most of the time because one transaction would reserve space for revokes,
> then it would be merged with the system transaction (sdp->sd_log_tr) and =
it
> usually did not run out, because you can hold a lot of revoke entries
> per log descriptor block. Some of the code, such as gfs2_write_revokes, w=
ould
> work around this and somehow got it right most of the time. However, some
> jdata tests with xfstests generic/269 encountered problems when it actual=
ly
> ran out.

Would something like this work to fix the revoke accounting?

--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -256 +255,0 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp,
u64 blkno, unsigned int len)
-       struct gfs2_trans *tr =3D current->journal_info;
@@ -268 +267 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp,
u64 blkno, unsigned int len)
-                       tr->tr_num_revoke--;
+                       bd->bd_tr->tr_num_revoke--;

Thanks,
Andreas


