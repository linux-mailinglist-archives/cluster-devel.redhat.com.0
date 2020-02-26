Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C17A416F867
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Feb 2020 08:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582701321;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+cW0lnEzv24VTV1d4tlCXIwxJ5xgr1UrEh+ugljUEhQ=;
	b=a2pUYvw2mSbkaanKBKz4lzwPRbTVXJZ3BrQZfddlFg4TkmS4HWmp/VuRkG3z7+DpgRngpz
	lQR+jQjXmLaqJ0a+dT5pDULeNJcxQ7G6x+ss7a9PNre5l9JY9/VeNxQws2537k8Dx25Va8
	Iwd0J8FHyRNiyEDCg34cYYjDjb8xc3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-2nOsaqLMMri5vzi2t7vSFw-1; Wed, 26 Feb 2020 02:14:39 -0500
X-MC-Unique: 2nOsaqLMMri5vzi2t7vSFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08C0E107B267;
	Wed, 26 Feb 2020 07:14:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A088C06D;
	Wed, 26 Feb 2020 07:14:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E08B84462;
	Wed, 26 Feb 2020 07:14:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01Q7ES3K014077 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 02:14:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 988B110AF423; Wed, 26 Feb 2020 07:14:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93D4F10AF422
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 07:14:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07EFB1011E00
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 07:14:26 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-80-X-Z_zCp6Nh6lTEFOYjlz4w-1;
	Wed, 26 Feb 2020 02:13:42 -0500
X-MC-Unique: X-Z_zCp6Nh6lTEFOYjlz4w-1
Received: from vvs-ws.sw.ru ([172.16.24.21])
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <vvs@virtuozzo.com>)
	id 1j6qt1-0003a5-Lp; Wed, 26 Feb 2020 10:13:39 +0300
From: Vasily Averin <vvs@virtuozzo.com>
To: cluster-devel@redhat.com
References: <5fb7919e-3bb7-3c90-b42d-495a63b71457@virtuozzo.com>
Message-ID: <09f15ac1-9483-7b95-236c-29d7b25476b6@virtuozzo.com>
Date: Wed, 26 Feb 2020 10:13:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5fb7919e-3bb7-3c90-b42d-495a63b71457@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01Q7ES3K014077
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 1/1] table_seq_next should increase
	position index
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Could I get any comments?

Unfortunately I do not have enough experience with dlm and cannot verify th=
e patch locally

Usually you can observe following related problems:
- read after lseek beyond end of file, described by NeilBrown in =20
 commit 1f4aace60b0e ("fs/seq_file.c: simplify seq_file iteration code and =
interface")
 "dd if=3D<AFFECTED_FILE> bs=3D1000 skip=3D1" will incorrectly generate who=
le last line

- read after lseek on into middle of last line will output expected rest of
 last line but then repeat whole last line once again.=20

- If .show() function generates multi-line output following bash script wil=
l never finish.

 $ q=3D;while read -r r;do echo "$((++q)) $r";done < AFFECTED_FILE

Thank you,
=09Vasily Averin

On 1/24/20 9:03 AM, Vasily Averin wrote:
> if seq_file .next fuction does not change position index,
> read after some lseek can generate unexpected output.
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206283
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
> ---
>  fs/dlm/debug_fs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
> index d6bbccb..c1eda93 100644
> --- a/fs/dlm/debug_fs.c
> +++ b/fs/dlm/debug_fs.c
> @@ -523,7 +523,7 @@ static void *table_seq_next(struct seq_file *seq, voi=
d *iter_ptr, loff_t *pos)
>  =09=09ri->rsb =3D r;
>  =09=09spin_unlock(&ls->ls_rsbtbl[bucket].lock);
>  =09=09dlm_put_rsb(rp);
> -=09=09++*pos;
> +=09=09++(*pos);
>  =09=09return ri;
>  =09}
>  =09spin_unlock(&ls->ls_rsbtbl[bucket].lock);
> @@ -542,6 +542,7 @@ static void *table_seq_next(struct seq_file *seq, voi=
d *iter_ptr, loff_t *pos)
> =20
>  =09=09if (bucket >=3D ls->ls_rsbtbl_size) {
>  =09=09=09kfree(ri);
> +=09=09=09++(*pos);
>  =09=09=09return NULL;
>  =09=09}
>  =09=09tree =3D toss ? &ls->ls_rsbtbl[bucket].toss : &ls->ls_rsbtbl[bucke=
t].keep;
>=20


