Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CA3D73D66F3
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 20:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627325428;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D95tn59mnst4hG0z1263atEPgmnluB5nA5a1xUlymg4=;
	b=CzcWVYEiLFvfzK9yaKtSTwxxm9xy3Gc3W936gQTznVZIX4Xk/yoc5PfrOU40QohCb3ogFp
	4ZOp4Tv8TaJP5u0/Rp0PdTe4KS/MScBWbwmZMNc7GVKU5QBqra934acgzxZtJ3FErzyIvU
	Wg/RlPJcaRUFbwVMji7F2TganxeGXcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-6kCBxzGoNe-PmYEussTJBw-1; Mon, 26 Jul 2021 14:50:27 -0400
X-MC-Unique: 6kCBxzGoNe-PmYEussTJBw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6C1E801AE3;
	Mon, 26 Jul 2021 18:50:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A0BB60C0F;
	Mon, 26 Jul 2021 18:50:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D496B4BB7C;
	Mon, 26 Jul 2021 18:50:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QIoJ3b003930 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 14:50:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 368FB2028116; Mon, 26 Jul 2021 18:50:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A992028114
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 18:50:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7F29101A54C
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 18:50:15 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-458-R3KzZyeJML6cJpeQOmq_wg-1; Mon, 26 Jul 2021 14:50:14 -0400
X-MC-Unique: R3KzZyeJML6cJpeQOmq_wg-1
Received: by mail-io1-f70.google.com with SMTP id
	u15-20020a5ec00f0000b029052c7ba9d3c3so9270264iol.17
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 11:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=D95tn59mnst4hG0z1263atEPgmnluB5nA5a1xUlymg4=;
	b=HyNu3hugSSnxSGSCZJzx3ngyYEv2opUbdyeUL92jsJPE8/+QhwjafeXFDeWrD9mP0Q
	wBh1khzdeEk4qKkUH92jzdQHKBK03CyHl6ECpDX68QaZmv4B/8QazOY8Mdu8Oif4GqKY
	TizsqMfCvoTG/BbxhmYo72E0bcNgGO0P3UZH8gUftMSJB9cjcvlnb3r88my8qPYPbl7H
	8ZtFL7QY0IPLLMHwBLYAbshB7S/Y0dDk16i5LyiOQw2fwdE6e/0B3HCQc/AkAF90Hn5B
	ykRUoAsX5cc5IdbQAT0GB5kfj+PA7u3yqQM81+SCOY4OPmeFk5iPws3/F9dOTD1U8Qa9
	SQXw==
X-Gm-Message-State: AOAM532ah/7c5jSx8uru8nR2eTfp4Gho4m5vc34HHJ7YawAuDegNZw53
	ACmnVVYfO8bq+HJ81ETFUJPrgFZigZzXHBJdisSBzi1xuBveNUJulcWgbwj1llbtEDQzkJYJBh1
	Io9OkpvsBCj05GMcc2zaUUqYXfhgZw+CbJBRBKeRF5bkKpWzL5EYAzhdILy8ZMngBGlfwzS9/RA
	==
X-Received: by 2002:a5d:8b85:: with SMTP id p5mr15632114iol.43.1627325413310; 
	Mon, 26 Jul 2021 11:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQR7xqxpXG7Cr3z8b0k244556lDZKILUZKT45OED4IsguCLgDZsZpPrNzUyrLF4sf+MOkk9A==
X-Received: by 2002:a5d:8b85:: with SMTP id p5mr15632105iol.43.1627325413154; 
	Mon, 26 Jul 2021 11:50:13 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id x9sm457997iol.2.2021.07.26.11.50.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 26 Jul 2021 11:50:12 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Andreas Gruenbacher <agruenba@redhat.com>
References: <20210726140058.GA9206@lst.de>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <612d262a-e997-e887-ade9-1edc5efab758@redhat.com>
Date: Mon, 26 Jul 2021 13:50:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726140058.GA9206@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] gfs2 hang in xfstests generic/361 (v3)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
> [ 1491.752284]
> [ 1491.752587] =============================
> [ 1491.753403] [ BUG: Invalid wait context ]
> [ 1491.754122] 5.14.0-rc2+ #47 Not tainted
> [ 1491.754860] -----------------------------
> [ 1491.755563] kworker/2:1H/1975 is trying to lock:
(snip)

FYI: I just pushed a replacement patch to linux-gfs2/for-next.next4.
The patch I mentioned last time had problems, so this is a simplified
middle-ground between that patch and the one I suggested earlier.
Patch is a89a427e0afe.

Bob Peterson

