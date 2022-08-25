Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2A5A163C
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Aug 2022 17:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661443184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xEiY+WREuIGyRNs0gG0L8hkAymOW1NRN8id04ZVQ7x8=;
	b=JYoQOb3Bf7AfoHDMqoAJ7ib1CMQW/KDOZmDBcRmYc1BVK90Ael53t3vE3Ui8j/DYdkgq3i
	XUHHAsY9sU3co1CxiMZG5ArIrU/To2H5byjRyG8AJhKv8sYHOEGNw7LJEZlJFjmpwROdak
	kmZTe8y2ZtqImGkf2Pcc66DMaTKRxfw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-f2obzK3bOrqVELe8jYyUiA-1; Thu, 25 Aug 2022 11:59:40 -0400
X-MC-Unique: f2obzK3bOrqVELe8jYyUiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0A6B3833294;
	Thu, 25 Aug 2022 15:59:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE26F141513E;
	Thu, 25 Aug 2022 15:59:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 545341946A5E;
	Thu, 25 Aug 2022 15:59:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 91BFF1946A43 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 15:59:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8110740C141D; Thu, 25 Aug 2022 15:59:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D9B54010FA1
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 15:59:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 650C5185A794
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 15:59:36 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-105ZST_pPUGjV60UQ_7iiw-1; Thu, 25 Aug 2022 11:59:35 -0400
X-MC-Unique: 105ZST_pPUGjV60UQ_7iiw-1
Received: by mail-pf1-f200.google.com with SMTP id
 a19-20020aa780d3000000b0052bccd363f8so9261321pfn.22
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 08:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xEiY+WREuIGyRNs0gG0L8hkAymOW1NRN8id04ZVQ7x8=;
 b=j5Geodm5i6iASWIf3OgIDbK5m0PZo/5l5ZnO28lVkxS9PcdAtcKiG2IAPTTUsHR6j3
 zzFsiTh0a9j8EUIDV3NZh5SXiEMBjSjsCciJ5X5Cd10FRxvbG5wvu/IszFe3ZrIAxKOI
 niVqxa+9+Xzp1P1sq6XFau7TKy2dJl6RNhhIUWwd4hotX571V1cQpXGRr+paeLbRWmND
 ljmm1ecWxrTrmEzlInPNZOAECNpjJnVVSa06femEcNGfpoVEP/IVLvLBPEDx+Yg3mhJF
 QB+Hyc8ZXlOS8skBJZM2dxOzTQlh/l9OP4JcebMdDyAMiEVa7eXFsnTFmYBSsMbd2wkb
 hDEw==
X-Gm-Message-State: ACgBeo0jIpEUaVrecMnIicO4Kz5OxyL6ACBkONRgW+MmZVKRcPb3qOVk
 C0MWv1Ul6qc7JFt/nqeOHdwPqNULFOnIMTlTMfY2jPe1iVTjqBojOOr/TgLK1pj96IUCfvDB/IZ
 zIMAwbNA1yqzTvBAzmGXAtOekE4FNU/e2cKskRw==
X-Received: by 2002:a63:4d0e:0:b0:412:1877:9820 with SMTP id
 a14-20020a634d0e000000b0041218779820mr3818758pgb.177.1661443173753; 
 Thu, 25 Aug 2022 08:59:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5UM0lZHwXtCzPqjz9OTeG9hawS8U4lIAQDjm0VuvpbEuKZaB5yNQSDTa+ZJQYNTPtp79MHRotzPfZOxM/xqwg=
X-Received: by 2002:a63:4d0e:0:b0:412:1877:9820 with SMTP id
 a14-20020a634d0e000000b0041218779820mr3818739pgb.177.1661443173532; Thu, 25
 Aug 2022 08:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220818183238.121677-1-rpeterso@redhat.com>
In-Reply-To: <20220818183238.121677-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 25 Aug 2022 17:59:22 +0200
Message-ID: <CAHc6FU7zAh19pT6j6secT2NsRHNYT3stL2dPeQ5+sZarQLng8A@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] [GFS2 v3 PATCH 0/3] gfs2: Misc withdraw patches
 (version 3)
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 8:32 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This is version 3 which has further simplification and improvements.
>
> This patch set fixes a few bugs in how gfs2 handles file systems after
> withdraw. In an ideal world, after a file system is withdrawn, users
> should be able to unmount the file system without problems. However, we
> discovered three problems that prevented clean unmounts:
>
> 1. A duplicate iput of the journal after attempted recovery caused
>    kernel panics after withdraw.
> 2. After withdraw, unmount would hang for its alloted timeout period
>    when glocks had waiters queued that, due to the withdraw, could
>    never be granted.
> 3. Unmount would similarly hang when the withdraw prevented an outgoing
>    request to dlm, but so the glock was never unlocked.
>
> Bob Peterson (3):
>   gfs2: Prevent double iput for journal on error
>   gfs2: Dequeue waiters when withdrawn
>   gfs2: Clear flags when withdraw prevents xmote
>
>  fs/gfs2/glock.c | 36 ++++++++++++++++++++++++++++++++++--
>  fs/gfs2/glock.h |  1 +
>  fs/gfs2/util.c  |  6 ++++++
>  3 files changed, 41 insertions(+), 2 deletions(-)
>
> --
> 2.37.2
>

Pushed to for-next.

Thanks,
Andreas

