Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 38A723D7B3D
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 18:41:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627404084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JCPP0hsC14J5HW6g2WHH7QmpBltvYiir61tZ+KDiVkM=;
	b=Y5odNN1I61MBpRBlTY9Iyzn1qof2momKbQHwnwU3o7Q0jK4Je9ZaPeev0dFmVgDlKn2Q53
	orlsZqmnUnATlGNUPSPsXlnJXWy+Pp9lxbPS49pkxhhsItL3r7uoSuhjMem16D69sd2zjc
	0k626zJUinfJrNLG0O4E3+2/3oLXeGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-2eAzOLbpPhif0BoyzsmMwg-1; Tue, 27 Jul 2021 12:41:23 -0400
X-MC-Unique: 2eAzOLbpPhif0BoyzsmMwg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 948EA1084F54;
	Tue, 27 Jul 2021 16:41:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2207219D7C;
	Tue, 27 Jul 2021 16:41:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64CA6180BAB1;
	Tue, 27 Jul 2021 16:41:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RGfBTp015942 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 12:41:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56DF021623BD; Tue, 27 Jul 2021 16:41:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5190621677F7
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 16:41:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC68818A6580
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 16:41:08 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
	[209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-540-v1bHRTmGM4OadmVrXYr9tA-1; Tue, 27 Jul 2021 12:41:06 -0400
X-MC-Unique: v1bHRTmGM4OadmVrXYr9tA-1
Received: by mail-il1-f200.google.com with SMTP id
	p6-20020a056e021446b0290205af2e2342so7094920ilo.15
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 09:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JCPP0hsC14J5HW6g2WHH7QmpBltvYiir61tZ+KDiVkM=;
	b=UgR9MKylPVvzkN9D0F9p1ufp+TwHwMoYFNQKAB74iIZjdRu0gqdPEUJPsvS/IQHb8R
	2kR6jBkgtc2cxesMiDGXrinLuOozkgEEKY3dGUqPWSDRgrhYWU4m3kTirBSTs681OGXR
	FENb6vLpYfg5stdYVffEI21vCqd/dTkeqGmNPAcoA0srifW8hD/Npv1wXl/m9TE0ryER
	nSdcgOBo+8MH6RCkAEQzpzTmrAwC4ko3UeEVsvwJyBaCNXvh9USzI/+bVmAmuVlLaBPp
	AevGODGdJ32/BMNCGkD2Ei17ddtkxRzdHbUBVom9s4u4EDe0fwcYsPYUIrkiiWLCygcI
	p5fQ==
X-Gm-Message-State: AOAM532REc5B+Oco7H2MCCk66M/aXkAtCe8emfM3oUSNDFBToxTHGs1U
	bfOGEDIumVg58Kw6OumhlMeNDkct4ISq2lmEifvbeW74i19aowamYeIuTDNiLiakbHc11VLqm8n
	Ue179oDk2Cbo2AKqPah6IduKMRb7jDydPkHJrG77GeB0aPUKzbMWNW6VnP5vT9Yxl1EdLg6GVSw
	==
X-Received: by 2002:a5e:9918:: with SMTP id t24mr19641760ioj.24.1627404065748; 
	Tue, 27 Jul 2021 09:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYVBy8TBwL4xktSPASoyfgtf4u7ZhD9k+NWGhufTQVrhUer2nKppIUJztDJZjpQFOH9M7+zw==
X-Received: by 2002:a5e:9918:: with SMTP id t24mr19641745ioj.24.1627404065581; 
	Tue, 27 Jul 2021 09:41:05 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id
	t24sm2688131ioh.24.2021.07.27.09.41.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 27 Jul 2021 09:41:04 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20210726140058.GA9206@lst.de>
	<612d262a-e997-e887-ade9-1edc5efab758@redhat.com>
	<20210727070546.GA12839@lst.de>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <41435c9a-0e0c-e02b-495b-3425734b94c0@redhat.com>
Date: Tue, 27 Jul 2021 11:41:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727070546.GA12839@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/27/21 2:05 AM, Christoph Hellwig wrote:
> On Mon, Jul 26, 2021 at 01:50:11PM -0500, Bob Peterson wrote:
>> FYI: I just pushed a replacement patch to linux-gfs2/for-next.next4.
>> The patch I mentioned last time had problems, so this is a simplified
>> middle-ground between that patch and the one I suggested earlier.
>> Patch is a89a427e0afe.
> 
> With just that patch cherry picked the test still hangs.
> 
> The entire linux-gfs2/for-next.next4 completes a quick group xfstests
> run, but with a lot of failures:
> 
> Failures: generic/079 generic/082 generic/092 generic/094 generic/103 generic/219 generic/230 generic/235 generic/244 generic/294 generic/306 generic/347 generic/379 generic/380 generic/382 generic/383 generic/384 generic/385 generic/386 generic/400 generic/441 generic/452 generic/488 generic/545 generic/566 generic/587 generic/594 generic/600 generic/601 generic/603
> Failed 30 of 514 tests
> 
Hi Christoph,

Can you please pull my latest linux-gfs2/for-next.next4 branch and try 
your full run again? I added a patch to not treat the usrquota / 
grpquota / prjquota mount options as errors, and I added a new patch 
from Andreas for generic/079 and it all seems to work okay for me
(although I haven't done a full run yet). TIA.

Regards,

Bob Peterson

