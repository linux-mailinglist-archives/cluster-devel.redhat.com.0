Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4C550E85
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Jun 2022 04:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655691175;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=q+FP7vbO3M33qFh5nomTeLPYri9Nx6KXcv0VZw9WEf4=;
	b=BSI3LwVlkeb4G8k7POd4q62SIE1szuPu2qQKOWvm+MDY5QV6I6WXq+mAdDZVItAiYXGRHv
	PuDJplsIJOjnkEVptiDVpmtsDXkj0TF8b1b+/8g0IBP7WVQ9rLK50DUEpe0YIC585h45ru
	oUJV6BdU7SmeeeFWZ3nkT4ZJUmGQGQY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-ghCgHED8OR6L6IqG198Syg-1; Sun, 19 Jun 2022 22:12:48 -0400
X-MC-Unique: ghCgHED8OR6L6IqG198Syg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1663C3C025C4;
	Mon, 20 Jun 2022 02:12:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6842026985;
	Mon, 20 Jun 2022 02:12:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5BBD1947071;
	Mon, 20 Jun 2022 02:12:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B3A7194706D for <cluster-devel@listman.corp.redhat.com>;
 Mon, 20 Jun 2022 02:12:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A64EAC28112; Mon, 20 Jun 2022 02:12:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2A24C08F22
 for <cluster-devel@redhat.com>; Mon, 20 Jun 2022 02:12:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EBB8802D1F
 for <cluster-devel@redhat.com>; Mon, 20 Jun 2022 02:12:42 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-SwXfbVsbPL6sR7ckRBtlhw-1; Sun, 19 Jun 2022 22:12:41 -0400
X-MC-Unique: SwXfbVsbPL6sR7ckRBtlhw-1
Received: by mail-qv1-f72.google.com with SMTP id
 kl30-20020a056214519e00b0046d8f1cd655so10476920qvb.19
 for <cluster-devel@redhat.com>; Sun, 19 Jun 2022 19:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+FP7vbO3M33qFh5nomTeLPYri9Nx6KXcv0VZw9WEf4=;
 b=KUSleWgxzbplTs9ttVKR779l3aYqg2RQpcPUkY1OdtZSvF4nhB+/04W3PEiYvUmnr/
 QETugP3eM/W9Ttx9gt26gf+YN887c/NH3T37P1i0AXpZyCcvEihbKsfbfgC8Ne8a36Jf
 V4C4WgtP9T45Ye/4VZDnI20Yn5Z22gwPsrFVa7psANHiZ6xMz53ryy9VfMyO/wJE29ig
 Hs2FcitTXRb7E2jBFtTCz/LraWFKzi+oNKPOUsV/c5H/BOLRY9AYttepalJq91+kwUky
 KxuczuELz8GLK7qGehTy9a3cuRb3VhWQhnzngfL9efYyjbqDelxw+mEBrsDqgPLBSrYj
 m2lg==
X-Gm-Message-State: AJIora+QHV7XR2zaBy4pyp99b9h98VXUXa8HINW835XGiy6jabVAYDbE
 nhairyZAXFpcWsIs6LGUDCnAngGgIrj11z69eEd/a8gdqJmCO4aaD1wb/zQJJLrRI4NRMke9xMZ
 z2ODOKOg7mDOsFfyF2yccb7hYaxT3c/IRJGZ2Jg==
X-Received: by 2002:ad4:5f86:0:b0:46b:9505:5a27 with SMTP id
 jp6-20020ad45f86000000b0046b95055a27mr17516034qvb.2.1655691160724; 
 Sun, 19 Jun 2022 19:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhd4Z/5w7byjsgkVmDcpi/PbouFuAZ27nchN5mTHn5airkVF0LL/7coMH3lsGSO43VQ/HP6TwYJ2a83SQive0=
X-Received: by 2002:ad4:5f86:0:b0:46b:9505:5a27 with SMTP id
 jp6-20020ad45f86000000b0046b95055a27mr17516028qvb.2.1655691160519; Sun, 19
 Jun 2022 19:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220615141459.2275135-1-aahringo@redhat.com>
In-Reply-To: <20220615141459.2275135-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Sun, 19 Jun 2022 22:12:29 -0400
Message-ID: <CAK-6q+i7a_6OFsQgNsnecwN=b9pYdFzGhUEJBDnz4VApuP8qcQ@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH dlm/next] fs: dlm: add dlm_is_member()
 check if fenced
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Jun 15, 2022 at 10:15 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds an additional check if the "fenced" node is part of any
> lockspace. A node should not be part of any lockspace when it's got
> fenced. This is an additional requirement besides that all lockspace
> activity should be stopped before calling dlm_midcomms_close().
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/lockspace.c | 5 ++++-
>  fs/dlm/lockspace.h | 2 +-
>  fs/dlm/midcomms.c  | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> index 0c3613d09c5e..a4f492189a08 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -923,12 +923,15 @@ void dlm_stop_lockspaces(void)
>                 log_print("dlm user daemon left %d lockspaces", count);
>  }
>
> -void dlm_stop_lockspaces_check(void)
> +void dlm_stop_lockspaces_check(int nodeid)
>  {
>         struct dlm_ls *ls;
>
>         spin_lock(&lslist_lock);
>         list_for_each_entry(ls, &lslist, ls_list) {
> +               if (WARN_ON(dlm_is_member(ls, nodeid)))
> +                       break;
> +

I will drop this patch. I currently run into this warning. We can
assume that there are no dlm messages processed that we transmit any
new reply message. Also no new message can be triggered by e.g.
dlm_lock(), because the previously checked if recovery lock is held
and the lockspace running check.

There exist two kinds of "memberships" one is nodeid (lockspace level)
and one is node IP (socket level). This one will cut socket level and
there is a MUST requirement which is probably done afterwards to
remove the node from all lockspaces. I probably would like to see
first the lockspace member being removed THEN the socket connection
gets closed...  however it's probably the other way around and maybe
due the fact of corosync chronological order callback handling (e.g.
lost quorum vs resource membership), I will look again into that in
another time to see how things can maybe be changed... (if possible)

Maybe midcomms_close can also remove the lockspace member and if there
is a "nodeid from resource membership removal" afterwards, we simply
don't care if it's already removed...

- Alex

