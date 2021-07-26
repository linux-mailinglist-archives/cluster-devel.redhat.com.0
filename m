Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 220833D653A
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 19:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627319530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UZ4dAOUxyLlGTp6N2yYdQ9fp7VbN697dSF6suzbwXXc=;
	b=W5wgGgWoMnDknOnUrjb37c28rg08kAhw5fk3Slhf85WWVICxU8ur3wefLB1RTDkuEp6vZY
	oSKNc6lHNZL1DvIQJ/l28ppWBYndesSX4cxVx7WeCHLtl79dX+lUnsXI6051jjKOzT+pnL
	YGg7myJ4q8Rts2CGcQeE86IM+6RcpQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-j0RTaUn2N8mOz0x15I7jiA-1; Mon, 26 Jul 2021 13:12:09 -0400
X-MC-Unique: j0RTaUn2N8mOz0x15I7jiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B532E1019623;
	Mon, 26 Jul 2021 17:12:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8985D6A1;
	Mon, 26 Jul 2021 17:12:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E3134BB7C;
	Mon, 26 Jul 2021 17:12:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QHC5v9022500 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 13:12:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E245C4404C; Mon, 26 Jul 2021 17:12:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C703FAEC81
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:12:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 526EA800B35
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 17:12:02 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
	[209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-66-c3A34_r5PXWh6G6W496Bhg-1; Mon, 26 Jul 2021 13:12:01 -0400
X-MC-Unique: c3A34_r5PXWh6G6W496Bhg-1
Received: by mail-io1-f71.google.com with SMTP id
	d7-20020a6b6e070000b02904c0978ed194so9080581ioh.10
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 10:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UZ4dAOUxyLlGTp6N2yYdQ9fp7VbN697dSF6suzbwXXc=;
	b=gSMBejP7c9A0eanporuRVsLH5D1BQ4Tp9jGg74Y+v9LQhjg/I2EFM+CxjNHRKt7Uh4
	S40PsT3puZ2ytxez8FOkihsDBjqTZaebfd2GtmNfXBH4DX2dHWDymuk+nYH0nvfS0ytl
	MnVCsCu0hv98Vvnrb74c8KnpnE6PjFrIsi3HcV8ANrBslu7TnVTwrCeC9l7yPOQ+EAXC
	DuelSwJnASWA5oOD3vGMdBheSK91Ey7dywTm/AmrhIMyD4w0IYcRlpyYFI4FXiuw8BXL
	5taIxrdkfgHHyhIKBP4t0JsDebUpplrAvP9BxwQkytcCBzAl3M2DOvqliwO0oUjvusv0
	82RA==
X-Gm-Message-State: AOAM533u4o/yQWFmQY61bY54wdUOP6NwVSnS+mfK2ZPwRnACPEuRXWKJ
	mWCpusEFGSqmDPoOxfnyURmY7SnKnlo6DlQp3lNxpiJpqBl6WMVu2qTwV/ezMs9rgdKBgMymhBq
	CVd8VCHBp1N00CsJdPFfI9R7edk4lkDiMQJnTlKT8DOwnHkwTsiYDy/EROVBte94byWbBr2aadQ
	==
X-Received: by 2002:a6b:e417:: with SMTP id u23mr15542334iog.91.1627319519857; 
	Mon, 26 Jul 2021 10:11:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKbsHdGXwCbhHSKLFmWDIWWvT/Am+Qakyw2g/3Njo04Y3ykF5duo5L8z1WIMtsRbpMySEoJw==
X-Received: by 2002:a6b:e417:: with SMTP id u23mr15542312iog.91.1627319519610; 
	Mon, 26 Jul 2021 10:11:59 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id e9sm177201ils.61.2021.07.26.10.11.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 26 Jul 2021 10:11:58 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>
References: <20210726140058.GA9206@lst.de>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <bc4786a3-625f-e663-622b-f0fe4899ad03@redhat.com>
Date: Mon, 26 Jul 2021 12:11:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726140058.GA9206@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] gfs2 hang in xfstests generic/361
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/26/21 9:00 AM, Christoph Hellwig wrote:
> I noticed this hang while testing the iomap_iter series on gfs2,
> but it also reproduces on 5.14-rc3.  This is running locally with
> "-O -p lock_nolock":
> 
> generic/361 files ... [ 1479.222703] run fstests generic/361 at 2021-07-26 13:57:10
(snip)
> [ 1491.752587] =============================
> [ 1491.753403] [ BUG: Invalid wait context ]
> [ 1491.754122] 5.14.0-rc2+ #47 Not tainted
> [ 1491.754860] -----------------------------
> [ 1491.755563] kworker/2:1H/1975 is trying to lock:
> [ 1491.756370] ffff8881048d0888 (&wq->mutex){+.+.}-{3:3}, at: flush_workqueue+0xc9/0x5f0

Hi Christoph,

Okay, I can recreate the failure you hit. The problem is that a withdraw
is happening from the glock workqueue, which is not right, since the
withdraw sequence itself waits for that workqueue to be flushed out.
(The withdraw itself is expected in this case, due to the IO errors.)

A patch like the following should hopefully fix the deadlock and/or BUG
by deferring the withdraw until the gfs2_logd daemon or something else
catches the error the next time it runs its loop. This is what is
supposed to happen in other similar situations we've had in the past.
Basically, we ignore the withdraw until it can be handled from a more
appropriate context.

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 42c15cfc0821..c138850b1f27 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -364,10 +364,8 @@ static int gfs2_ail1_empty(struct gfs2_sbd *sdp, 
int max_revokes)
  	ret = list_empty(&sdp->sd_ail1_list);
  	spin_unlock(&sdp->sd_ail_lock);

-	if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags)) {
+	if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
  		gfs2_lm(sdp, "fatal: I/O error(s)\n");
-		gfs2_withdraw(sdp);
-	}

  	return ret;
  }

Can you try something like that and see if it handles the withdraw more
sanely? Thanks.

Regards,

Bob Peterson

