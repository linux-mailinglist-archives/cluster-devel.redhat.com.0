Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 354636DB280
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Apr 2023 20:09:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680890940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ij7uDQEt7OoC3gzgZ3tZqjFkRTxGVdbzCD/wwJBh2J8=;
	b=UdykRB2EPw6yG95/psZXupAmnJ0HFIXhd70g257KkSQC+D2Y53ntfMm3vuAn9WEDRmNyxs
	0MH6kiFycodECuX4qoF5ibfAl2uMNNF9G54bccTpgqtV43z7cmIMxRzieHahxWSTxYxcOc
	gGQw5yjXl/qRaTvZrJRqBlFpomNc314=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-DyD1r6TBNzSHKLCtxGXQlw-1; Fri, 07 Apr 2023 14:08:56 -0400
X-MC-Unique: DyD1r6TBNzSHKLCtxGXQlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FA923802B8A;
	Fri,  7 Apr 2023 18:08:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 313DD40C6EC4;
	Fri,  7 Apr 2023 18:08:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D79451946A40;
	Fri,  7 Apr 2023 18:08:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C8E0419465BB for <cluster-devel@listman.corp.redhat.com>;
 Fri,  7 Apr 2023 18:08:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12BB12027063; Fri,  7 Apr 2023 18:08:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2292027062
 for <cluster-devel@redhat.com>; Fri,  7 Apr 2023 18:08:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7C5E29AA3B0
 for <cluster-devel@redhat.com>; Fri,  7 Apr 2023 18:08:46 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-gOu7bM4FPyCiZS9X9T0qXQ-1; Fri, 07 Apr 2023 14:08:37 -0400
X-MC-Unique: gOu7bM4FPyCiZS9X9T0qXQ-1
Received: by mail-pj1-f46.google.com with SMTP id
 d22-20020a17090a111600b0023d1b009f52so1989276pja.2
 for <cluster-devel@redhat.com>; Fri, 07 Apr 2023 11:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680890916; x=1683482916;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ij7uDQEt7OoC3gzgZ3tZqjFkRTxGVdbzCD/wwJBh2J8=;
 b=lsx0gcR+WHWNcRpaTnTF+U8ah/qkjxJx9UKV6GBoy1y+ZMyvL8KzgkgBdP8l3Vp1h/
 sklq68TP9f1GbSU9gLfLK87Eh0em6gVFDlfV36vHAPLEWTDIs9JwYgjDTKmlQDorDuOL
 jTUpetzV851+dY5HP5Sz9KSAW37hzT1DkJuB+FLXFg/IhQLPwAPWWb6v5YCgtSgsBhd5
 oLkB7U/8dVMFjyreX2jNlZGCcP02dlcVIvX+dVXBSj7V8KVCN3FiQp7pyuobr7nSf9HA
 X0BC68uQ/YKUMMZpduGlKqVkkToR/dWfy3uZARZAXTdSQeOhhBudX5IntcF3XrxY+cnt
 JcaQ==
X-Gm-Message-State: AAQBX9fPyRuk9koznh7Lyw/9ykukr/SnMpTAxg2C9yffQDeEC3cIv3lJ
 KO6bi4gFHIs0inNMPtHZNsKofBw9TVGkME7hRX+iNA==
X-Google-Smtp-Source: AKy350ZEWjuFoz+sL7oAnHomo0iHyqQI1Sm5L+Ii9IqLyzhBmLJPQvFAtHbFOlXt/tvMV1txjQqW/7K5sxOi9yfnuT0=
X-Received: by 2002:a17:90a:5997:b0:244:9b8f:c3bf with SMTP id
 l23-20020a17090a599700b002449b8fc3bfmr807289pji.7.1680890915820; Fri, 07 Apr
 2023 11:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230330132114.1826399-1-trix@redhat.com>
In-Reply-To: <20230330132114.1826399-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:08:24 -0700
Message-ID: <CAKwvOdkim2tY3VvR_ejCuzVivEH3iadZYFE_dnMS1shXfJ5eUA@mail.gmail.com>
To: Tom Rix <trix@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH] fs: dlm: remove unused count_match
 variable
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
Cc: cluster-devel@redhat.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, nathan@kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 6:21=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> fs/dlm/dir.c:67:26: error: variable
>   'count_match' set but not used [-Werror,-Wunused-but-set-variable]
>         unsigned int count =3D 0, count_match =3D 0, count_bad =3D 0, cou=
nt_add =3D 0;
>                                 ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Fixes: commit c04fecb4d9f7 ("dlm: use rsbtbl as resource directory")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I can't help but wonder what this logic originally intended, but this
was introduced back in 2012, so guessing no one cares/remembers/hits
related issues.

The condition above is
149         if (result =3D=3D DLM_LU_MATCH &&
150             nodeid !=3D memb->nodeid) {

which looks like the condition you removed could have been folded into
that originally:

if (result =3D=3D DLM_LU_MATCH) {
  if (nodeid =3D=3D memb->nodeid)
    ++count_match;
  else {
    ...


> ---
>  fs/dlm/dir.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
> index fb1981654bb2..982f7a5570fe 100644
> --- a/fs/dlm/dir.c
> +++ b/fs/dlm/dir.c
> @@ -64,7 +64,7 @@ int dlm_recover_directory(struct dlm_ls *ls)
>         char *b, *last_name =3D NULL;
>         int error =3D -ENOMEM, last_len, nodeid, result;
>         uint16_t namelen;
> -       unsigned int count =3D 0, count_match =3D 0, count_bad =3D 0, cou=
nt_add =3D 0;
> +       unsigned int count =3D 0, count_bad =3D 0, count_add =3D 0;
>
>         log_rinfo(ls, "dlm_recover_directory");
>
> @@ -158,14 +158,6 @@ int dlm_recover_directory(struct dlm_ls *ls)
>                                                              b, namelen);
>                                 }
>
> -                               /* The name was found in rsbtbl, and the
> -                                * master nodeid matches memb->nodeid. */
> -
> -                               if (result =3D=3D DLM_LU_MATCH &&
> -                                   nodeid =3D=3D memb->nodeid) {
> -                                       count_match++;
> -                               }
> -
>                                 /* The name was not found in rsbtbl and w=
as
>                                  * added with memb->nodeid as the master.=
 */
>
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers

