Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E72D33599CA
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 11:48:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-Xmq1hbvVPYa5GtqnUPMfag-1; Fri, 09 Apr 2021 05:48:51 -0400
X-MC-Unique: Xmq1hbvVPYa5GtqnUPMfag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD3D983DD20;
	Fri,  9 Apr 2021 09:48:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFED95C3E0;
	Fri,  9 Apr 2021 09:48:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAE3744A5B;
	Fri,  9 Apr 2021 09:48:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1399mcNh020451 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 05:48:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD14810545C8; Fri,  9 Apr 2021 09:48:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A797010545E6
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 09:48:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFCDD80A1D5
	for <cluster-devel@redhat.com>; Fri,  9 Apr 2021 09:48:34 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com
	[45.249.212.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-453-xUS-1z8DM0eA_JTiG6hgYA-1; Fri, 09 Apr 2021 05:48:32 -0400
X-MC-Unique: xUS-1z8DM0eA_JTiG6hgYA-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGtY03JgDzPnX8;
	Fri,  9 Apr 2021 17:45:40 +0800 (CST)
Received: from [10.174.178.48] (10.174.178.48) by smtp.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
	17:48:20 +0800
To: Ye Bin <yebin10@huawei.com>, Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>
References: <20210409095139.2293922-1-yebin10@huawei.com>
From: "weiyongjun (A)" <weiyongjun1@huawei.com>
Message-ID: <ea193d44-5416-66ff-6749-5a77a1661901@huawei.com>
Date: Fri, 9 Apr 2021 17:48:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210409095139.2293922-1-yebin10@huawei.com>
X-Originating-IP: [10.174.178.48]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1399mcNh020451
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Hulk Robot <hulkci@huawei.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH -next] dlm: use DEFINE_MUTEX() for mutex
	lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit

两个标题一样的可以合并

在 2021/4/9 17:51, Ye Bin 写道:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>   fs/dlm/lockspace.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> index c14cf2b7faab..fa3ae801aa43 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -26,7 +26,7 @@
>   #include "ast.h"
>   
>   static int			ls_count;
> -static struct mutex		ls_lock;
> +static DEFINE_MUTEX(ls_lock);
>   static struct list_head		lslist;
>   static spinlock_t		lslist_lock;
>   static struct task_struct *	scand_task;
> @@ -231,7 +231,6 @@ static const struct kset_uevent_ops dlm_uevent_ops = {
>   int __init dlm_lockspace_init(void)
>   {
>   	ls_count = 0;
> -	mutex_init(&ls_lock);
>   	INIT_LIST_HEAD(&lslist);
>   	spin_lock_init(&lslist_lock);
>   
>


