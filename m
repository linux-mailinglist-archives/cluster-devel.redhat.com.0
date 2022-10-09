Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F68B5F888F
	for <lists+cluster-devel@lfdr.de>; Sun,  9 Oct 2022 02:18:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665274730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fW2Xjhwl7FDCWuGfDkWAA0CBLmORKawtRaQZc3MAgb0=;
	b=hTmFFfZ0R3nAGI3rnq/Z2BtEFlX1NablDJV+yjT/SgFowcONUb/2pwi7l0gS/r5CZrayvn
	Jszn3BUY0XONfBmIruYNbsO1KnxGod/EyjAkOZZfcOcs5rsVuJTPDRwwLj+gALjh2DPcD/
	1tvI944Or8BjURdsfgc4h2GxLcF699M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-PvLLc__UPGyudI0jjxMGfQ-1; Sat, 08 Oct 2022 20:18:47 -0400
X-MC-Unique: PvLLc__UPGyudI0jjxMGfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24225185A79C;
	Sun,  9 Oct 2022 00:18:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9318C40C958D;
	Sun,  9 Oct 2022 00:18:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 50FD01946595;
	Sun,  9 Oct 2022 00:18:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 327811946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 00:18:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EB99CC68E3B; Sun,  9 Oct 2022 00:18:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3FE8C68E39
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 00:18:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C94E929AA385
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 00:18:40 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-gePwy85GNxy_RdPLzeJsuw-1; Sat, 08 Oct 2022 20:18:39 -0400
X-MC-Unique: gePwy85GNxy_RdPLzeJsuw-1
Received: by mail-pj1-f45.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso9287738pjq.1
 for <cluster-devel@redhat.com>; Sat, 08 Oct 2022 17:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kA0HUMgJdt2O8o8SG2VJ7q/PSPreCGT8pIhZWTT7H7M=;
 b=uOIgRIKIdomyjYwMvfocOJ4MZGxI4DzXjiB6zNCxiK8ooxreapSzPf/uubympM6ddM
 7CT1CWQgH+tokZZ80LYWuP391F7G78+lMQkm9peFpMB2bLQZZ0ghyPoCSJLjBdAX8Lq/
 9nnx5mM/TU9QINFQL/s55ZzdhDmKwY6LhSSaTJlQl+mrm5xkDeMf4h+Q1rRk9tCZC1+Y
 Euou4naxQYeVclJdQYwq+XhUHlcaQo6GAckbRDr9ahV5V6+hkzxZLobXcPMIbKK6BxmN
 APekNHVtmugfVYgzG+6PGCZhbAhXLNfwFGWRxkYgDLhpPvlLbdhBe96M2/h7zXJ/axxo
 iREA==
X-Gm-Message-State: ACrzQf2w8M0FLqVFLmZVkvkhWABqLEt48VCwwUQPZT48AFHF3s+upDGb
 pv5+XC9kMkv7+y0Ia7og1E70Pw==
X-Google-Smtp-Source: AMsMyM6OprtZR9DEBnCoqhxK/4A16BNErCSxZZW+JRdGni+bZY3KMwPDYi2OmP3iaFAYzhdquX7Gbw==
X-Received: by 2002:a17:902:e883:b0:17f:5e7f:2bbf with SMTP id
 w3-20020a170902e88300b0017f5e7f2bbfmr11845201plg.150.1665274717912; 
 Sat, 08 Oct 2022 17:18:37 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb90:338b:87a3:6e32:4dc5:2126:f18e])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a625101000000b00561b53512b0sm3986475pfb.195.2022.10.08.17.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 17:18:37 -0700 (PDT)
Date: Sat, 08 Oct 2022 17:18:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, cluster-devel@redhat.com
User-Agent: K-9 Mail for Android
In-Reply-To: <Y0IFEUjwXGZFf7bB@mail.google.com>
References: <Y0IFEUjwXGZFf7bB@mail.google.com>
Message-ID: <378C6BDE-0A68-4938-86CD-495BD5F35BE6@chromium.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v2][next] dlm: Replace one-element array
 with flexible-array member
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
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 8, 2022 4:17:37 PM PDT, Paulo Miguel Almeida <paulo.miguel.almei=
da.rodenas@gmail.com> wrote:
>One-element arrays are deprecated, and we are replacing them with
>flexible array members instead. So, replace one-element array with
>flexible-array member in struct dlm_ls, and refactor the rest of the
>code, accordingly.

Thanks for working on this!

>
>We strive to make changes that don't produce any before/after binary
>output differeces as that makes it easier for the reviewer to accept the
>patch. In this particular instance, it wasn't possible to achieve this
>due to the fact that the ls_name[1] size, which is used as the
>NUL-terminator space, was hidden within the struct's padding as shown
>below.
>
>$ diff <(objdump -M intel -j .text -D dlm.old) <(objdump -M intel -j
>.text -D dlm.new)

I'd suggest different options here, this is harder to map back to the sourc=
e line.
See https://outflux.net/blog/archives/2022/06/24/finding-binary-differences=
/
for lots of details. :)

>
>13778c13778
><     c693:=0949 8d bc 24 c0 08 00 =09lea    rdi,[r12+0x8c0]
>---
>>     c693:=0949 8d bc 24 c1 08 00 =09lea    rdi,[r12+0x8c1]

This implies something unexpected changed.

>
>$ pahole dlm.old -C dlm_ls
>...
>=09int                        ls_namelen;           /*  2232     4 */
>=09char                       ls_name[1];           /*  2236     1 */
>
>=09/* size: 2240, cachelines: 35, members: 90 */
>=09/* sum members: 2166, holes: 17, sum holes: 71 */
>=09/* padding: 3 */
>=09/* paddings: 3, sum paddings: 17 */
>=09/* forced alignments: 1 */
>} __attribute__((__aligned__(8)));
>
>$ pahole dlm.new -C dlm_ls
>...
>=09int                        ls_namelen;           /*  2232     4 */
>=09char                       ls_name[];            /*  2236     0 */
>
>=09/* size: 2240, cachelines: 35, members: 90 */
>=09/* sum members: 2165, holes: 17, sum holes: 71 */
>=09/* padding: 4 */
>=09/* paddings: 3, sum paddings: 17 */
>=09/* forced alignments: 1 */
>} __attribute__((__aligned__(8)));

This has trailing padding, so the struct size didn't actually change.

>This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
>routines on memcpy() and help us make progress towards globally
>enabling -fstrict-flex-arrays=3D3 [1].
>
>Link: https://github.com/KSPP/linux/issues/79
>Link: https://github.com/KSPP/linux/issues/228
>Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101836 [1]
>
>Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.co=
m>
>---
>My apologies for v2, there was an accidental <Cr> I added on
>the CC line which messed up the body of my previus email.=20
>
>This patch sets it right.
>
>---
> fs/dlm/dlm_internal.h | 2 +-
> fs/dlm/lockspace.c    | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
>index e34c3d2639a5..ce2e32ed2ede 100644
>--- a/fs/dlm/dlm_internal.h
>+++ b/fs/dlm/dlm_internal.h
>@@ -670,7 +670,7 @@ struct dlm_ls {
> =09void=09=09=09*ls_ops_arg;
>=20
> =09int=09=09=09ls_namelen;
>-=09char=09=09=09ls_name[1];
>+=09char=09=09=09ls_name[];
> };
>=20
> /*
>diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
>index bae050df7abf..c3a36f3197da 100644
>--- a/fs/dlm/lockspace.c
>+++ b/fs/dlm/lockspace.c
>@@ -473,7 +473,7 @@ static int new_lockspace(const char *name, const char =
*cluster,
>=20
> =09error =3D -ENOMEM;
>=20
>-=09ls =3D kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
>+=09ls =3D kzalloc(sizeof(struct dlm_ls) + namelen + 1, GFP_NOFS);

This is allocating 1 more byte than before, since the struct size didn't ch=
ange. But this has always allocated too much space, due to the struct paddi=
ng. For a "no binary changes" patch, the above "+ 1" needs to be left off.

I would expect the correct allocation size to be:
offsetof(typeof(*ls), ls_name) + namelen

Question, though: is ls_name _expected_ to be %NUL terminated, and was the =
prior 3 bytes of extra allocation accidentally required?

-Kees

--=20
Kees Cook

