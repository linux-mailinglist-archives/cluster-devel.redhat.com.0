Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ABBAB136CF7
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Jan 2020 13:24:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578659056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1kt/G5eQ4Tbs2jXUpg8CDEkSo/6ZhTKN8AYB/oFey04=;
	b=NmCumIqVbAsn5id3Lj+zWOHq+zqiu1CbY3f+lhhW1FS8NCq8Rj+LCRFVdroxjevCNVwr7q
	7Wsj7qZWQ1UTVRyg82+zNbzwk6TynDHKyJJfRuWbXiafUDiqHMgIYOGGDZifmh9J9RqEgZ
	ULxNmZRHgpzH6415DS818iW5hy3qPgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-USq7zJtWMDK8EuRjaTmUwQ-1; Fri, 10 Jan 2020 07:24:13 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64199800594;
	Fri, 10 Jan 2020 12:24:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDCD35DA2C;
	Fri, 10 Jan 2020 12:24:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4294503D8;
	Fri, 10 Jan 2020 12:24:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00ACNxtD009056 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jan 2020 07:23:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 509392022EAC; Fri, 10 Jan 2020 12:23:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7FE2022EAB
	for <cluster-devel@redhat.com>; Fri, 10 Jan 2020 12:23:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75DA386D73E
	for <cluster-devel@redhat.com>; Fri, 10 Jan 2020 12:23:57 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-VHvoEexkMbyh_7m7qvYjjQ-1; Fri, 10 Jan 2020 07:23:54 -0500
Received: by mail-ot1-f71.google.com with SMTP id e22so908868ote.5
	for <cluster-devel@redhat.com>; Fri, 10 Jan 2020 04:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b6uOABtb2vkKG/+YIAUPs0+fZmlKkxn9liKuumgqlpk=;
	b=DzetdzDTeAYYWbhNK8Qglp3grVyKKmHb6GQPtsvua5hSA7gLRNR1XfWFNvF1ohh+IX
	dUswXnbn8mjUfKMf4rUlvY8XOdInoLL1aQCfxGGfe0XXT2wr93zC63Fk+sAQI7eftDl9
	+hL8Msp9rHPY3qNN4mh5cbjUoGBLjaDMjvhYiQVRx/5Ma/sHp++HnWdD2dv/eiXQqekq
	gRenrLrGFtYBmFPSDS2ulR+aOXjx+qgboB3Qrh8mCff30KBhTFqC5FFeHEIw9Z0mdXmf
	E0kbB359Zcl3uwly0r+k19mXkkPIM3PVH7biWDuzJ0XXNYosjM3tR97dBeShb+Vqovec
	vVDw==
X-Gm-Message-State: APjAAAUyv0nJUQP+2w12mBSEtGPcfa66N0vLK3EbbePM+2TW3XLG+Dpv
	jhPxquj1HYFYFAiCh9ugD7xL4nlTyvQfv6VErpiI4sF98yRDyBNarZl2HovBPL94ZL4CEeB8wJr
	kU4GyqeQXG20jw9ja60awL9UbZsw7/zJcIjYWjw==
X-Received: by 2002:aca:50cd:: with SMTP id e196mr2017935oib.178.1578659033078;
	Fri, 10 Jan 2020 04:23:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxDU5ronq4ERZ+7Km+KXbtjodW+8tf8+j61vkgC1AyYOdri7piZ1vnz0EZ5H8pkkPSRKRbKrtk4F6zQE+T+DEc=
X-Received: by 2002:aca:50cd:: with SMTP id e196mr2017924oib.178.1578659032815;
	Fri, 10 Jan 2020 04:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20200103153123.402971-1-rpeterso@redhat.com>
	<20200103153123.402971-2-rpeterso@redhat.com>
In-Reply-To: <20200103153123.402971-2-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 10 Jan 2020 13:23:41 +0100
Message-ID: <CAHc6FU5QJhpWUdwjAxd9LSV6vvOzYXBp+XFdfkD+StTCkmv_Tw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: VHvoEexkMbyh_7m7qvYjjQ-1
X-MC-Unique: USq7zJtWMDK8EuRjaTmUwQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00ACNxtD009056
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 1/6] gfs2: revoke cleanup:
	leaf_dealloc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bob,

On Fri, Jan 3, 2020 at 4:33 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Several gfs2 functions failed to reserve enough revoke entries for their
> transactions in the journal. Function gfs2_trans_remove_revoke unconditio=
nally
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
>
> This patch is part of a series that tries to do proper accounting of revo=
kes.
>
> This patch adds the needed revoke entries to function leaf_dealloc.

it seems this patch should be safe to add to for-next (with a fixed
patch description). Can you do so?

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/dir.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
> index eb9c0578978f..dfc3a3fa894d 100644
> --- a/fs/gfs2/dir.c
> +++ b/fs/gfs2/dir.c
> @@ -2031,7 +2031,8 @@ static int leaf_dealloc(struct gfs2_inode *dip, u32=
 index, u32 len,
>
>         error =3D gfs2_trans_begin(sdp,
>                         rg_blocks + (DIV_ROUND_UP(size, sdp->sd_jbsize) +=
 1) +
> -                       RES_DINODE + RES_STATFS + RES_QUOTA, l_blocks);
> +                       RES_DINODE + RES_STATFS + RES_QUOTA, RES_DINODE +
> +                                l_blocks);
>         if (error)
>                 goto out_rg_gunlock;
>
> --
> 2.24.1

Thanks,
Andreas


