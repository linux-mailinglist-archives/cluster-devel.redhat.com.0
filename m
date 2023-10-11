Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BDE7C4B3D
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 09:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697008110;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NOp45/9ZeYjLn5H2Urn6J5aeakMKoB8E25eCZMARLbc=;
	b=bDcFIibb9+s6JmWM8ybq7+Tm82pvwE40AsOk2mVRAORN066Regkk82i2NE/HIE8oSXJkh0
	/W+b8hh8NgZEud9ikZf420tb8okqYUZP4o9A7hNiQch3XY/VodBe1xBql5f1t7j07D+MOZ
	TekSjwfRcDZkZA3M1V5jGJjvVyGSZTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-TQygDrRoMAy407mMlji_Xg-1; Wed, 11 Oct 2023 03:08:27 -0400
X-MC-Unique: TQygDrRoMAy407mMlji_Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D1D7887E4F;
	Wed, 11 Oct 2023 07:08:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C23181C060DF;
	Wed, 11 Oct 2023 07:08:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7981B19465BD;
	Wed, 11 Oct 2023 07:08:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 809591946597 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Oct 2023 06:34:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6123F63F55; Wed, 11 Oct 2023 06:34:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 598E051E3
 for <cluster-devel@redhat.com>; Wed, 11 Oct 2023 06:34:19 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1569738008AD
 for <cluster-devel@redhat.com>; Wed, 11 Oct 2023 06:34:19 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-183-fwI5oqjyPFW61ZkZdL9ixw-1; Wed,
 11 Oct 2023 02:34:17 -0400
X-MC-Unique: fwI5oqjyPFW61ZkZdL9ixw-1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 59EF2CE1FED;
 Wed, 11 Oct 2023 06:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255B6C433C7;
 Wed, 11 Oct 2023 06:24:32 +0000 (UTC)
Date: Wed, 11 Oct 2023 08:24:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <2023101124-overlying-gating-62c8@gregkh>
References: <20231010220448.2978176-1-aahringo@redhat.com>
 <20231010220448.2978176-2-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231010220448.2978176-2-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH RESEND 2/8] fs: dlm: Fix the size of a
 buffer in dlm_create_debug_file()
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linuxfoundation.org
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 06:04:42PM -0400, Alexander Aring wrote:
> From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>=20
> 8 is not the maximum size of the suffix used when creating debugfs files.
>=20
> Let the compiler compute the correct size, and only give a hint about the
> longest possible string that is used.
>=20
> When building with W=3D1, this fixes the following warnings:
>=20
>   fs/dlm/debug_fs.c: In function =E2=80=98dlm_create_debug_file=E2=80=99:
>   fs/dlm/debug_fs.c:1020:58: error: =E2=80=98snprintf=E2=80=99 output may=
 be truncated before the last format character [-Werror=3Dformat-truncation=
=3D]
>    1020 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls-=
>ls_name);
>         |                                                          ^
>   fs/dlm/debug_fs.c:1020:9: note: =E2=80=98snprintf=E2=80=99 output betwe=
en 9 and 73 bytes into a destination of size 72
>    1020 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls-=
>ls_name);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
>   fs/dlm/debug_fs.c:1031:50: error: =E2=80=98_queued_asts=E2=80=99 direct=
ive output may be truncated writing 12 bytes into a region of size between =
8 and 72 [-Werror=3Dformat-truncation=3D]
>    1031 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts",=
 ls->ls_name);
>         |                                                  ^~~~~~~~~~~~
>   fs/dlm/debug_fs.c:1031:9: note: =E2=80=98snprintf=E2=80=99 output betwe=
en 13 and 77 bytes into a destination of size 72
>    1031 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts",=
 ls->ls_name);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
>=20
> Fixes: 541adb0d4d10b ("fs: dlm: debugfs for queued callbacks")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/debug_fs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
> index e9726c6cbdf2..c93359ceaae6 100644
> --- a/fs/dlm/debug_fs.c
> +++ b/fs/dlm/debug_fs.c
> @@ -973,7 +973,8 @@ void dlm_delete_debug_comms_file(void *ctx)
> =20
>  void dlm_create_debug_file(struct dlm_ls *ls)
>  {
> -=09char name[DLM_LOCKSPACE_LEN + 8];
> +=09/* Reserve enough space for the longest file name */
> +=09char name[DLM_LOCKSPACE_LEN + sizeof("_queued_asts")];
> =20
>  =09/* format 1 */
> =20
> --=20
> 2.39.3
>=20

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

