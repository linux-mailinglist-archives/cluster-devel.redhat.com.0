Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9669834D726
	for <lists+cluster-devel@lfdr.de>; Mon, 29 Mar 2021 20:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617042638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kVOyB6KSqzLpGtiP/sJzWrefKdjfbqfFERx39MO85xk=;
	b=DgUvvMnM3K2y+MMr59uFZ2zJZhS1oRIAf/V1XesP4SRgoBFyss8vTuoNRJv0laQfm+SnbT
	P5o0iCB9wWsI12gCx1+ix5FJ8PvDIvfktZw4cIOw/Pnn6I9GdnDpPwa3PDMhbG9omYAv75
	emke6ZBZvs/tGdQDxfED73C6SVzm+No=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-wiJn3_wNPAuiWIfBfnCs5g-1; Mon, 29 Mar 2021 14:30:37 -0400
X-MC-Unique: wiJn3_wNPAuiWIfBfnCs5g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC0AB8710FD;
	Mon, 29 Mar 2021 18:30:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E95639A60;
	Mon, 29 Mar 2021 18:30:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32A481809C83;
	Mon, 29 Mar 2021 18:30:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12TIUKZR004355 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 14:30:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1E9F19726; Mon, 29 Mar 2021 18:30:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50B4D19D7C;
	Mon, 29 Mar 2021 18:30:17 +0000 (UTC)
Date: Mon, 29 Mar 2021 13:30:15 -0500
From: David Teigland <teigland@redhat.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <20210329183015.GE3080@redhat.com>
References: <20210327083704.1092954-1-yangyingliang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210327083704.1092954-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH -next] fs: dlm: fix missing unlock on
 error in accept_from_sock()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 27, 2021 at 04:37:04PM +0800, Yang Yingliang wrote:
> Add the missing unlock before return from accept_from_sock()
> in the error handling case.

Thanks, applied to the next branch.
Dave

> Fixes: 6cde210a9758 ("fs: dlm: add helper for init connection")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  fs/dlm/lowcomms.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 73cc1809050a..166e36fcf3e4 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -931,6 +931,7 @@ static int accept_from_sock(struct listen_connection *con)
>  			result = dlm_con_init(othercon, nodeid);
>  			if (result < 0) {
>  				kfree(othercon);
> +				mutex_unlock(&newcon->sock_mutex);
>  				goto accept_err;
>  			}
>  
> -- 
> 2.25.1

