Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C9254B830
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jun 2022 19:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655229582;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QaYaoTZregCywGGXRK5frVeEy9GrtFTlLk+soek0E/M=;
	b=B6LHW8MPmnNoM5ZEzPdS2yQpysPWYYxjnNP3zVOukKT9TyWrxujK9w0umZkhfzdrU+vBoZ
	C7vTus8zGBlL69AF66DKaZbk3GPopFyIgjj9wqcT8WAc3b9fcQRBaNExwfqjkoyfuSrFLG
	gxK+EKu5DC5mqZ3JIYzBFL/32c1fops=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-NB61FwMaO0WgdvNaWieBsg-1; Tue, 14 Jun 2022 13:59:38 -0400
X-MC-Unique: NB61FwMaO0WgdvNaWieBsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 615A5811E80;
	Tue, 14 Jun 2022 17:59:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB8392166B26;
	Tue, 14 Jun 2022 17:59:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87B5A194707E;
	Tue, 14 Jun 2022 17:59:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6D6E9194706D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 14 Jun 2022 17:59:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 56D76492CA4; Tue, 14 Jun 2022 17:59:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53251492C3B
 for <cluster-devel@redhat.com>; Tue, 14 Jun 2022 17:59:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B3A738005CF
 for <cluster-devel@redhat.com>; Tue, 14 Jun 2022 17:59:33 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-VxawsFLSOmeHlQK9wI8opA-1; Tue, 14 Jun 2022 13:59:32 -0400
X-MC-Unique: VxawsFLSOmeHlQK9wI8opA-1
Received: by mail-qk1-f198.google.com with SMTP id
 y8-20020a05620a44c800b006a6f8cd53cbso8045227qkp.5
 for <cluster-devel@redhat.com>; Tue, 14 Jun 2022 10:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QaYaoTZregCywGGXRK5frVeEy9GrtFTlLk+soek0E/M=;
 b=BZkUtAUoorEA3M1FgqzhY5AAQMAIy0liPMTm089Lq6Zaj1SF0SWF+CrchKSHGrdLX6
 U+saQBio8+VGwJtCKEXy/i5cio32lAcBZTnvflNyW7YdHXqewdNpJ3SE789CUuhhZ0x/
 g05AN+iumD14+c+N7dAt2NGQUWHJHZWsA2+fynItxrsO4vm60htliJFy/GEmFd+wImlB
 VZc+YBNb5Alf9MmiX7uZOn29mOFsk9v0pBac5mwjux0UgpaYVkzqFtDdoGxytBN46ibz
 yIgldjnuImKVtBUfbDCAGtd+BEwiSkIq0qoBMw9VVdeurBj/htDqOx1jW0E//4I4KLDH
 i/5Q==
X-Gm-Message-State: AOAM533jQo2XYC4SU+lM5AfFclqUlPEHTIG/Ro8RT+wK+H+JOayP3QDm
 8XJs1CgHHccnw4hf0tggAF8MtgngvqdShHuRT51o648Tjm2ELe2r3i8Tiud4BkI4Ql2rSGD4J5F
 WgLx1Azvi5ctpvZGr2dlmzDHPCE6I2E6PvlzOvQ==
X-Received: by 2002:ac8:5dd2:0:b0:304:ea09:4688 with SMTP id
 e18-20020ac85dd2000000b00304ea094688mr5385814qtx.526.1655229571236; 
 Tue, 14 Jun 2022 10:59:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWzuJY8+5Jqv28n9gWA2O51AhaNAcLCdqAd6RZPYBSOyCIn51KSXk6VObYBfhVx5/aX73m1X6sldInpr1wcqM=
X-Received: by 2002:ac8:5dd2:0:b0:304:ea09:4688 with SMTP id
 e18-20020ac85dd2000000b00304ea094688mr5385795qtx.526.1655229570889; Tue, 14
 Jun 2022 10:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220610170616.3480642-1-aahringo@redhat.com>
 <20220610170616.3480642-8-aahringo@redhat.com>
In-Reply-To: <20220610170616.3480642-8-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 14 Jun 2022 13:59:19 -0400
Message-ID: <CAK-6q+hpwt1-SJwg+E3oLFc=xFH2gkQRFvdGO8pCvZhR3_-HtA@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v5.19-rc1 7/7] fs: dlm: add WARN_ON for
 non waiter case
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Jun 10, 2022 at 1:06 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds a WARN_ON if recovery hits a critical error but no
> caller was waiting in dlm_new_lockspace(), this can occur e.g. if a
> node got fences. The WARN_ON signals us to investigate into this case
> that it should not occur.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/recoverd.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/dlm/recoverd.c b/fs/dlm/recoverd.c
> index eeb221c175a2..240267568aab 100644
> --- a/fs/dlm/recoverd.c
> +++ b/fs/dlm/recoverd.c
> @@ -311,6 +311,7 @@ static void do_ls_recovery(struct dlm_ls *ls)
>
>                                 /* let new_lockspace() get aware of critical error */
>                                 ls->ls_recovery_result = error;
> +                               WARN_ON(completion_done(&ls->ls_recovery_done));

I will drop this patch, I think it can race because
dlm_new_lockspace() triggers recovery and then waits... race is
unlikely but I think the better approach is here to look at debug
messages to see why recovery fails then. Debug messages may need to be
improved depending on the case and I will just send patches if there
is any information missing.

- Alex

