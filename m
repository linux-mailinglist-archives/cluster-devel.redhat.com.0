Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C64883919E8
	for <lists+cluster-devel@lfdr.de>; Wed, 26 May 2021 16:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622038823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Tw3kDFX/e5vI26qc+xYDQKOURNEBK6wDgxbcgNjQMwo=;
	b=U8fg8KLtXTBF8FWEOXHl87EvRMtC7JSLq4FLWnC99BN/ak88/HGCoX+XFS2qqPh4qo424K
	yA5sD1M38K8vS+KsKTm8j6lzyBQ6i9VMqOckmJclUBcveYFaEZ9e4mCaK6XI6z/q2shcAB
	99K7K8th5DiSC+MvDxoXhV4l9OTD3kY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-YVT_DmPwP061oPlmdCGCyg-1; Wed, 26 May 2021 10:20:22 -0400
X-MC-Unique: YVT_DmPwP061oPlmdCGCyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1F188797F6;
	Wed, 26 May 2021 14:20:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2EE3E14B;
	Wed, 26 May 2021 14:20:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80F7955345;
	Wed, 26 May 2021 14:20:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QEK8NV028826 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 10:20:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBA3E103CA2; Wed, 26 May 2021 14:20:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7A8E1037BF
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 14:20:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95B911857F33
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 14:20:05 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
	[209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-131-UgXudQchN2Kr2WM6mP2egw-1; Wed, 26 May 2021 10:20:02 -0400
X-MC-Unique: UgXudQchN2Kr2WM6mP2egw-1
Received: by mail-il1-f200.google.com with SMTP id
	g5-20020a056e020d05b02901d1d44df5fcso892076ilj.7
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 07:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tw3kDFX/e5vI26qc+xYDQKOURNEBK6wDgxbcgNjQMwo=;
	b=tIzKQXXd7koJmwi9qj44uq9QQd0V/5xusAXhFbqHdpjCUJD7wpQyuikgECr6m7jIi5
	z7Is1n+M618698ww3p/kh4Xto3EELHolaFv+igdj3kkp6L5P4X7HwPg24n2cihJdeVJT
	qM/zJg8pA6ktFxatgR6SXvJI60b5e3V7bunm4j6fxpU2AuuajWQ5KQNbcDkAWT12Te6V
	/C6ZN04NgpQ4Y9T8farWl9ADqkBttIprs5HL7wm4jK1IKJfil0xhwenWvGcspMWz2GGU
	SMinIEpAtI5gIMkCGQCfJCSxcKm9A3NW0SyMOOJwEnANOxM0oMEhQj2q/nZ30SRCifn6
	vYJg==
X-Gm-Message-State: AOAM531MVaJd7vjEqVdU1xyjqOPWYmqgwjtZHu1pS99Hz3PqXksqAm2A
	vysZ5q6NRnxSFF32FlCjTXRTurJX2HJd6C52k+97m021BWE4X8yJigy9EwNocQVxyZFG28TokRl
	dPgvnSD6fpMI/4evmFLH4s2mem+iVfKhbZxWMtA==
X-Received: by 2002:a6b:8b58:: with SMTP id n85mr25868914iod.196.1622038801213;
	Wed, 26 May 2021 07:20:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6/xvJNSWX0KtrZyJUfd0teZL7cTFZvv9eEhh/QHbQfAh7gs/CemXpahHhE+Ltl8yqoScZYBgb4bH1K8GexEw=
X-Received: by 2002:a6b:8b58:: with SMTP id n85mr25868903iod.196.1622038801001;
	Wed, 26 May 2021 07:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210526134039.3448305-1-colin.king@canonical.com>
In-Reply-To: <20210526134039.3448305-1-colin.king@canonical.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Wed, 26 May 2021 10:19:49 -0400
Message-ID: <CAK-6q+jXZ2MGUw3QPKHwoNDMLdTookO7rq9LpGNx=ZGAn1pqOQ@mail.gmail.com>
To: Colin King <colin.king@canonical.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH][next] fs: dlm: Fix memory leak of
	object mh
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, May 26, 2021 at 9:40 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is an error return path that is not kfree'ing mh after
> it has been successfully allocates.  Fix this by free'ing it.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/dlm/rcom.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
> index 085f21966c72..19298edc1573 100644
> --- a/fs/dlm/rcom.c
> +++ b/fs/dlm/rcom.c
> @@ -393,6 +393,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
>         if (rc_in->rc_id == 0xFFFFFFFF) {
>                 log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
>                 dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
> +               kfree(mh);
>                 return;

This seems to be a bigger issue, we cannot revert the buffer
allocation with a kfree, we cannot revert it at all. We should avoid
any error handling between create_rcom() and send_rcom(). In general
between get_buffer/commit_buffer.

I don't see a problem with moving the error handling before
create_rcom(). That should fix the issue.

- Alex

