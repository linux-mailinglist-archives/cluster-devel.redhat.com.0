Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9865B53B4A6
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Jun 2022 09:57:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654156672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1HOMdIfsoKxBYgZZnfljgLJ5NTDgYDEwfsVjpojtcs0=;
	b=aEG4y1wu4spTL2QfjePXtZPHjPxqHeXnH7Fl7wzcA5wJGOlfB57x3KURikFsPI3msnFXtM
	WHT7FCweXN6XAKurREzfqqMcBIpZOZT/7XGmjQi+H0hlzPsIUWRpmaRPR5izNSEJHDaDHq
	WRADthahLYvACxuz7RF3lPGp6LVZKro=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-GZtKg_JQMoOUqwsgewDWWA-1; Thu, 02 Jun 2022 03:57:49 -0400
X-MC-Unique: GZtKg_JQMoOUqwsgewDWWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC7A3C0D86A;
	Thu,  2 Jun 2022 07:57:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE6E640EC002;
	Thu,  2 Jun 2022 07:57:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A47661949759;
	Thu,  2 Jun 2022 07:57:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6CBEB1947B83 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Jun 2022 07:57:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 501D9C27E9D; Thu,  2 Jun 2022 07:57:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CA51C27E8F
 for <cluster-devel@redhat.com>; Thu,  2 Jun 2022 07:57:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35A5D29ABA02
 for <cluster-devel@redhat.com>; Thu,  2 Jun 2022 07:57:46 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-rHDFGIs_PDqWoe2wqOBIXw-1; Thu, 02 Jun 2022 03:57:45 -0400
X-MC-Unique: rHDFGIs_PDqWoe2wqOBIXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so2047679wms.5
 for <cluster-devel@redhat.com>; Thu, 02 Jun 2022 00:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1HOMdIfsoKxBYgZZnfljgLJ5NTDgYDEwfsVjpojtcs0=;
 b=sJT0OzSO1a75HNuzdNeU27YoRVbyzItohP+uGAt+zsd7nqfwAVzcMWnQi1gMTzVxHV
 StxTrCccAULUGEj6dAwIxewoe4yzHXCwO8cWkNthQ3AxqB2sys2bi7WsiqHG+YRyN9nZ
 XArE6MtXRcfUg7PPA9vmIVcB1c+uQbleHjY1lDL0E7RTABkeg7/2hLD8/r9pk1iXMKCX
 4V7M1XjRxXnPDxCCVjqurgv8nivvHVFXe/yR6ipOr4QezP4zFWHW1iVBP4d4fqDbjXJG
 F4cNpg/xCOLyzxdSHUOP/qz2UVk4oy/lkKT0djdwoQaipxKR15nvoL6tONO4Rmh1F+3i
 yS2g==
X-Gm-Message-State: AOAM533QF6IRyPALJUdwP7ErZ4+6xgVRp8A3qQKVDBzpu7cuoVnA61w5
 0vz8MBtzeXy4YW164mWS9ljpozkFLJ7iT0uzzf0qV1q1/I3IVRW1IlRp62qm6IxdomJYfJl4MUZ
 gRmwF2eL2DpmGTmR0ARqFxS4MknZERH1YnQhFRQ==
X-Received: by 2002:a5d:538f:0:b0:211:8016:dda3 with SMTP id
 d15-20020a5d538f000000b002118016dda3mr2612073wrv.349.1654156663978; 
 Thu, 02 Jun 2022 00:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztroxVQ+L+TlYB55/pnJ/TTAcbLv8DLnq1jYqDDGg+CrtPlFNEcuy5UAtjra0hyH73xuPS6h57MzlFJbqrNpg=
X-Received: by 2002:a5d:538f:0:b0:211:8016:dda3 with SMTP id
 d15-20020a5d538f000000b002118016dda3mr2612059wrv.349.1654156663817; Thu, 02
 Jun 2022 00:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220602071939.278344-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220602071939.278344-1-chi.minghao@zte.com.cn>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 2 Jun 2022 09:57:32 +0200
Message-ID: <CAHc6FU6hiOHS-b7Ft0AwL+aOZwwgE6WjiJuN1ZRi2k2aH6Si8Q@mail.gmail.com>
To: cgel.zte@gmail.com
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH] gfs2: Remove redundant NULL check
 before kfree
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
Cc: cluster-devel <cluster-devel@redhat.com>, Zeal Robot <zealci@zte.com.cn>,
 LKML <linux-kernel@vger.kernel.org>, Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 2, 2022 at 9:19 AM <cgel.zte@gmail.com> wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> kfree on NULL pointer is a no-op.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  fs/gfs2/file.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 2cceb193dcd8..d8f1239344c1 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -1066,8 +1066,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
>                 gfs2_glock_dq(gh);
>  out_uninit:
>         gfs2_holder_uninit(gh);
> -       if (statfs_gh)
> -               kfree(statfs_gh);
> +       kfree(statfs_gh);
>         from->count = orig_count - written;
>         return written ? written : ret;
>  }
> --
> 2.25.1
>

Added to for-next, thanks.

Andreas

