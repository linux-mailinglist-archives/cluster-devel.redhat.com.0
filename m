Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E366ECFEE
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 16:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682345252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nRiU3d0WkInC5LE1JshqYEBtsRiWGsthGKLVJmji/vc=;
	b=CUhCmS7MOttfRpMzeFrs2/YCA3Wj2s2BJB1cneSk8ZHsED3fh6LYcAUPrZbOM4cKtVCof5
	4g7fy7Oqjf4Ne1M50EQiuLnL86EhLXeABJuql+bpIEA2dJcrR7VH3PQW7cCIWogWgyYgap
	ZFbSaMhRfuY8jgbxa1oWjrMw6Ou2dlw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-oGwFMb97O7mz9qv8X3jVzw-1; Mon, 24 Apr 2023 10:07:30 -0400
X-MC-Unique: oGwFMb97O7mz9qv8X3jVzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67FBDA0F384;
	Mon, 24 Apr 2023 14:07:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EAF41121318;
	Mon, 24 Apr 2023 14:07:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 44178194658F;
	Mon, 24 Apr 2023 14:07:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DEBD91946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 14:07:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8685C2027045; Mon, 24 Apr 2023 14:07:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EE162027043
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 14:07:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 588A43C0DDD2
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 14:07:24 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-anORep_lO6qo_hPsaO2bbw-1; Mon, 24 Apr 2023 10:07:14 -0400
X-MC-Unique: anORep_lO6qo_hPsaO2bbw-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-24732cc0c8fso4364994a91.3
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 07:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682345233; x=1684937233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRiU3d0WkInC5LE1JshqYEBtsRiWGsthGKLVJmji/vc=;
 b=WT9YYjikMvOz+gXToZpC7xgzV6SQsXjni40DXif75Zzi2s5uD4/yw+/OR5q8DqqQ7Z
 yqySCrtG2menELbDtK0yae9mnxonOnQaq87Zynu1wzptjH7jqB1qY+dPxRLGAb70fRy7
 rJa4heDMpoVE9tcuiQ5PvIHO/lDhiWLLb8yg9ir0FS3htWNj3b4OBH4MTtp423gW7CoC
 nm0yKHRobCKOD3NbnZqYEDb56pA0T8ZwOOUVEp+zAG1ZUaEAqMtOwNnZGuv3s15W+OCg
 GR5Kyvyu3p8EdWiYiJ6I4O7C9gnZsQsNHg1SzVGk0ubWtmRXpm9WRka+ev4XY905RYUG
 Yp1g==
X-Gm-Message-State: AAQBX9dPjiFsrD8y2lAEx7dJaZFtSabB1hTwojFAQUx0scQQqy5bmORi
 Ntw66ewKkpNHJBfGMQFm0etEya97RU3p7vNfE3EW91FBHW+Hdysmwmb4p/ayBKmrJdq1ka2VgQh
 Flbr+WCe4bpQQ3gxH7ku5Dpg7tWWaGPv8Zy04cgFs8dDquA==
X-Received: by 2002:a17:902:6904:b0:1a6:c6d4:5586 with SMTP id
 j4-20020a170902690400b001a6c6d45586mr14051060plk.13.1682345232945; 
 Mon, 24 Apr 2023 07:07:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZS/MMPbvmikclFkimXBIiLGDgSKW3tNeJPLzX4UeXw3/LWuzvwYJ0AKTPijhpNhJLnh82PBGYtkIMDUsvYAag=
X-Received: by 2002:a17:902:6904:b0:1a6:c6d4:5586 with SMTP id
 j4-20020a170902690400b001a6c6d45586mr14051039plk.13.1682345232641; Mon, 24
 Apr 2023 07:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230421190710.397684-1-rpeterso@redhat.com>
 <20230421190710.397684-2-rpeterso@redhat.com>
In-Reply-To: <20230421190710.397684-2-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 24 Apr 2023 16:07:00 +0200
Message-ID: <CAHc6FU5kDxahp+Y3d-=YQ+aoXfpqgbtObAC_ZrFXgwbyJhRAzw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [GFS2 PATCH 1/4] gfs2: return errors from
 gfs2_ail_empty_gl
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 9:07=E2=80=AFPM Bob Peterson <rpeterso@redhat.com> =
wrote:
> Before this patch, function gfs2_ail_empty_gl did not return errors it
> encountered from __gfs2_trans_begin. Those errors usually came from the
> fact that the file system was made read-only, often due to unmount,
> (but theoretically could be due to -o remount,ro) which prevented
> the transaction from starting.
>
> The inability to start a transaction prevented its revokes from being
> properly written to the journal for glocks during unmount (and
> transition to ro).
>
> That meant glocks could be unlocked without the metadata properly
> revoked in the journal. So other nodes could grab the glock thinking
> that their lvb values were correct, but in fact corresponded to the
> glock without its revokes properly synced. That presented as lvb
> mismatch errors.
>
> This patch allows gfs2_ail_empty_gl to return the error properly to
> the caller.

Alright,

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glops.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 6e33c8058059..8e245d793e6b 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -90,7 +90,7 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
>         struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
>         struct gfs2_trans tr;
>         unsigned int revokes;
> -       int ret;
> +       int ret =3D 0;
>
>         revokes =3D atomic_read(&gl->gl_ail_count);
>
> @@ -124,15 +124,15 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
>         memset(&tr, 0, sizeof(tr));
>         set_bit(TR_ONSTACK, &tr.tr_flags);
>         ret =3D __gfs2_trans_begin(&tr, sdp, 0, revokes, _RET_IP_);
> -       if (ret)
> -               goto flush;
> -       __gfs2_ail_flush(gl, 0, revokes);
> -       gfs2_trans_end(sdp);
> +       if (!ret) {
> +               __gfs2_ail_flush(gl, 0, revokes);
> +               gfs2_trans_end(sdp);
> +       }

but the above hunk doesn't help, so let me skip that.

>  flush:
>         gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
>                        GFS2_LFC_AIL_EMPTY_GL);
> -       return 0;
> +       return ret;
>  }
>
>  void gfs2_ail_flush(struct gfs2_glock *gl, bool fsync)
> @@ -326,7 +326,9 @@ static int inode_go_sync(struct gfs2_glock *gl)
>         ret =3D gfs2_inode_metasync(gl);
>         if (!error)
>                 error =3D ret;
> -       gfs2_ail_empty_gl(gl);
> +       ret =3D gfs2_ail_empty_gl(gl);
> +       if (!error)
> +               error =3D ret;
>         /*
>          * Writeback of the data mapping may cause the dirty flag to be s=
et
>          * so we have to clear it again here.
> --
> 2.39.2
>

Thanks,
Andreas

