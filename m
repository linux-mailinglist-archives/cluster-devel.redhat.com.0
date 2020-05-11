Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 946E31CDB5A
	for <lists+cluster-devel@lfdr.de>; Mon, 11 May 2020 15:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589204278;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iQJ0NFmWkNmgKs1GHRIZz2yMLqa3G7AY1zZzomY3aY8=;
	b=LgkzS0yFaV3IX2JQGTiblpUY9XlJR0GiMlpbSIDgzA42p7EWuwCbDT4D50UQvR8iEYpkwz
	tKztP+Ar8w22Cdxnza5Bl5OUM4ZUueNhzclUAWsOm6K8YADArxd4tlEWED1xytzQDV9HaO
	k6dxYayavi5DBYtNNUHI5l9VqnAOU2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-Mo3vDXqdNIqRFSxbZNAqVw-1; Mon, 11 May 2020 09:37:56 -0400
X-MC-Unique: Mo3vDXqdNIqRFSxbZNAqVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDECC835B42;
	Mon, 11 May 2020 13:37:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 885E01002382;
	Mon, 11 May 2020 13:37:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E07954E9E6;
	Mon, 11 May 2020 13:37:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BDbkPq000491 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 09:37:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E4D63108FE5B; Mon, 11 May 2020 13:37:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E088010F1CBA
	for <cluster-devel@redhat.com>; Mon, 11 May 2020 13:37:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254D88001E9
	for <cluster-devel@redhat.com>; Mon, 11 May 2020 13:37:43 +0000 (UTC)
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
	[216.71.145.142]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-45-I1mBgPDQOQeghn58SGPYvQ-1; Mon, 11 May 2020 09:37:37 -0400
X-MC-Unique: I1mBgPDQOQeghn58SGPYvQ-1
IronPort-SDR: LlhoiyEo63qszRUdDCnZwRokjmpdLwgJyc36ymCUY65/pVhvwl350/d8CULPhJocqxhoj7U04a
	gYpy7dx4zMayMaQs7YUHyRcHd+x+Kx9dArn2xlsJm9/p0OmR95GoqsVJpc2N0QvHrVZdjqN34Z
	L1AG2fiRjSnU0E0g7r5aSe13IwE7Ns3jd6yorVXEL+2MN2jWlvAvQYWIaNo+rHO4juyvgtAU2V
	ruemZeAQstijpObHW8f3BwHBCTZqyzmET6mpr0WKfmTHU1A6lqgg24hpJ73zdtBbi2Ui4C470w
	Psc=
X-SBRS: 2.7
X-MesageID: 17480251
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17480251"
To: Christine Caulfield <ccaulfie@redhat.com>, David Teigland
	<teigland@redhat.com>
References: <20200429121541.30802-1-ross.lagerwall@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <15c5ba2e-20eb-9e3b-6265-f71b06f891e6@citrix.com>
Date: Mon, 11 May 2020 14:36:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200429121541.30802-1-ross.lagerwall@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Mark.Syms@citrix.com
Subject: Re: [Cluster-devel] [PATCH] dlm: Switch to using wait_event()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Ping?

On 4/29/20 1:15 PM, Ross Lagerwall wrote:
> We saw an issue in a production server on a customer deployment where
> DLM 4.0.7 gets "stuck" and unable to join new lockspaces.
> 
> See - https://lists.clusterlabs.org/pipermail/users/2019-January/016054.html
> 
> This was forwarded off list to David Teigland who responded thusly.
> 
> "
> Hi, thanks for the debugging info.  You've spent more time looking at
> this than I have, but from a first glance it seems to me that the
> initial problem (there may be multiple) is that in the kernel,
> lockspace.c do_event() does not sensibly handle the ERESTARTSYS error
> from wait_event_interruptible().  I think do_event() should continue
> waiting for a uevent result from userspace until it gets one, because
> the kernel can't do anything sensible until it gets that.
> 
> Dave
> "
> 
> The previous attempt at fixing this was NAKed by Linus since it could
> cause a busy-wait loop. Instead, just switch wait_event_interruptible()
> to wait_event().
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  fs/dlm/lockspace.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> index afb8340918b8..e93670ecfae5 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -197,8 +197,6 @@ static struct kset *dlm_kset;
>  
>  static int do_uevent(struct dlm_ls *ls, int in)
>  {
> -	int error;
> -
>  	if (in)
>  		kobject_uevent(&ls->ls_kobj, KOBJ_ONLINE);
>  	else
> @@ -209,20 +207,12 @@ static int do_uevent(struct dlm_ls *ls, int in)
>  	/* dlm_controld will see the uevent, do the necessary group management
>  	   and then write to sysfs to wake us */
>  
> -	error = wait_event_interruptible(ls->ls_uevent_wait,
> -			test_and_clear_bit(LSFL_UEVENT_WAIT, &ls->ls_flags));
> +	wait_event(ls->ls_uevent_wait,
> +		   test_and_clear_bit(LSFL_UEVENT_WAIT, &ls->ls_flags));
>  
> -	log_rinfo(ls, "group event done %d %d", error, ls->ls_uevent_result);
> -
> -	if (error)
> -		goto out;
> +	log_rinfo(ls, "group event done %d", ls->ls_uevent_result);
>  
> -	error = ls->ls_uevent_result;
> - out:
> -	if (error)
> -		log_error(ls, "group %s failed %d %d", in ? "join" : "leave",
> -			  error, ls->ls_uevent_result);
> -	return error;
> +	return ls->ls_uevent_result;
>  }
>  
>  static int dlm_uevent(struct kset *kset, struct kobject *kobj,
>

