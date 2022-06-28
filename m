Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01555C0DA
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 14:07:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656418023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=X1kd7GH8+lVH8XJU2bub/L8ZRbbYTkBopp5Wt8QcoRg=;
	b=InA8/gY3zCOdWnn3bPmuuBJJkxdEHYQ2qb2RvrFYBubr3L7FMIlRMC/aBmXZN5xudKh5vQ
	otxE//n68nSTqKPMKwvkdcbbpcEPf2GAaHZ/HZK2MbJafSJJPu4T40yf5X5UUURPZHHxY+
	KLfezuXYDHxbBoET0s/qqjt5HjZZJhc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-nwh5n9nrPQmPqDu8yXhtwg-1; Tue, 28 Jun 2022 08:06:58 -0400
X-MC-Unique: nwh5n9nrPQmPqDu8yXhtwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1328D2999B59;
	Tue, 28 Jun 2022 12:06:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E9F8112131B;
	Tue, 28 Jun 2022 12:06:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E624E19466DF;
	Tue, 28 Jun 2022 12:06:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 85C1A19466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 12:06:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4BB232026D07; Tue, 28 Jun 2022 12:06:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 477222026D64
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 12:06:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BECB85A582
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 12:06:55 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-JeFK8UgaNmSRS9QtJiwp0w-1; Tue, 28 Jun 2022 08:06:51 -0400
X-MC-Unique: JeFK8UgaNmSRS9QtJiwp0w-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so5032884wmr.0
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 05:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1kd7GH8+lVH8XJU2bub/L8ZRbbYTkBopp5Wt8QcoRg=;
 b=Mc5l3UqPnV6sAsTmNROv2Y1ZilQaBfSjqlF18F5ux/R/mtuxI35zzEs3E/+CFze9Ut
 uOHlPF+IJhsV29A/suojaDh+dsrrc6atZ38yRve++1DVZ/gI+moGvQmj21q0cmHLYNzD
 Jb0Wcj8543o6wc+1q1+sAoMFNr5yM+FdX05hof9lMaQYIZjnQxgNnqh1MvXdS59cL2Ms
 TPOMLNvFTj77sxn0Qv+0t35lDB0h85kKI7i8saUnC3PHcFhZbQ3tgyxYMuU70Uea3Wx1
 tM6Jiy4WV59GcRhcgjUGQd7ZSv2PvOPP4eVhotMynuSdy7va42qWCRvvBjaTMZ4/JBZw
 Rnfg==
X-Gm-Message-State: AJIora9WCM8PYR4L2ebDx3kHymvCmXP6mbqpZE+feb1+6rFvfYvX6X7O
 yT3Ghq0sETDCZWKbIXmhhlxLu6QD1AJ4S1lOZv9egxA+7/ZFPHbx3sxgFYXe+FecAmppW1zz2Xh
 oAN+dZgTKtjaOShAy2knNujqQ2JIX0zq2IudDYA==
X-Received: by 2002:a7b:c4ce:0:b0:3a0:2ac4:3233 with SMTP id
 g14-20020a7bc4ce000000b003a02ac43233mr25474235wmk.92.1656418010520; 
 Tue, 28 Jun 2022 05:06:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uEXqbE6Sx0oikJPL2taoS9a5Pn8LiRB1rZvvRDicOju3qGxubgDoT47Zm1luHzWqTldwi7wRNsqyLrmcEcJcM=
X-Received: by 2002:a7b:c4ce:0:b0:3a0:2ac4:3233 with SMTP id
 g14-20020a7bc4ce000000b003a02ac43233mr25474206wmk.92.1656418010273; Tue, 28
 Jun 2022 05:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220628055949.566089-1-dzm91@hust.edu.cn>
In-Reply-To: <20220628055949.566089-1-dzm91@hust.edu.cn>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 28 Jun 2022 14:06:38 +0200
Message-ID: <CAHc6FU4PR9hwBY1NxdyAMAAh4rY+KHvO26PTSsDBXJ=yHK2msQ@mail.gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix overread in the strlcpy of
 init_names
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
Cc: Dongliang Mu <mudongliangabcd@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, cluster-devel <cluster-devel@redhat.com>,
 Jean Delvare <khali@linux-fr.org>, syzkaller <syzkaller@googlegroups.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Dongliang Mu,

On Tue, Jun 28, 2022 at 8:10 AM Dongliang Mu <dzm91@hust.edu.cn> wrote:
> From: Dongliang Mu <mudongliangabcd@gmail.com>
>
> In init_names, strlcpy will overread the src string as the src string is
> less than GFS2_FSNAME_LEN(256).
>
> Fix this by modifying strlcpy back to snprintf, reverting
> the commit 00377d8e3842.

... if the source string isn't NULL-terminated. But in that case, the
code will still do the same thing with this patch. In other words,
this doesn't fix anything. So let's check for NULL termination
instead.

Thanks,
Andreas

> Fixes: 00377d8e3842 ("[GFS2] Prefer strlcpy() over snprintf()")
> Reported-by: syzkaller <syzkaller@googlegroups.com>
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  fs/gfs2/ops_fstype.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index c9b423c874a3..ee29b50d39b9 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -383,8 +383,8 @@ static int init_names(struct gfs2_sbd *sdp, int silent)
>         if (!table[0])
>                 table = sdp->sd_vfs->s_id;
>
> -       strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> -       strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
> +       snprintf(sdp->sd_proto_name, GFS2_FSNAME_LEN, "%s", proto);
> +       snprintf(sdp->sd_table_name, GFS2_FSNAME_LEN, "%s", table);
>
>         table = sdp->sd_table_name;
>         while ((table = strchr(table, '/')))
> --
> 2.35.1
>

