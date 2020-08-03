Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA4023A3DC
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Aug 2020 14:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596456768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=U0tL39aLglkJrbRA5E3dM2LRcS8d3XyI4lDc3p0DpU8=;
	b=Re1j8ZKr2fQ8EwyXJovvF8MO7H9wt9i4KOVSr5DVPAl3VfMTgV124PLvVQBl6jNEvlFMTu
	QBlimA+onRAKVhNwMFHaK/wcu9oFxesvcUKfOMnjtZJHFplWNpU0cSElRkPb921yUxwdMa
	5hlB093BmlYkNVR0ygq4mqz2Y3tvhLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-Hq6IFlPEM2-ZUjfAR8IC-w-1; Mon, 03 Aug 2020 08:12:46 -0400
X-MC-Unique: Hq6IFlPEM2-ZUjfAR8IC-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 846301902EA4;
	Mon,  3 Aug 2020 12:12:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 735BF60CD1;
	Mon,  3 Aug 2020 12:12:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07DB19A10B;
	Mon,  3 Aug 2020 12:12:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 073CAevb001293 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 3 Aug 2020 08:10:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9877B20234BC; Mon,  3 Aug 2020 12:10:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7042220234B0
	for <cluster-devel@redhat.com>; Mon,  3 Aug 2020 12:10:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F08C8007CD
	for <cluster-devel@redhat.com>; Mon,  3 Aug 2020 12:10:38 +0000 (UTC)
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
	[209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-280-KeQsOPgDMnW5BaZNf5XLvw-1; Mon, 03 Aug 2020 08:10:36 -0400
X-MC-Unique: KeQsOPgDMnW5BaZNf5XLvw-1
Received: by mail-oo1-f69.google.com with SMTP id f13so184368ooo.13
	for <cluster-devel@redhat.com>; Mon, 03 Aug 2020 05:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U0tL39aLglkJrbRA5E3dM2LRcS8d3XyI4lDc3p0DpU8=;
	b=jRdLnIY7pQ/2lcHXgWbdW0a8/LmXoPYeNaB5d33xorY6UK57JPV2BrVeQP1PuzXY6v
	JNmwA1TmmgO/oFT67YzfqOI4GqRTVlR2pZPmuD02M0rTI1HI9W5DHlxq5syKnL2cEloQ
	ZWXVMVuZIE/4fIrDbRD6+lHqJDdQVsNVcKkzoXqJYFiye9WiuJ0LyK4X/v8kYOpdi5JE
	j+rleVR0yxZM4B5fVUuvKsz2juyGY+bqx0H0Rttk0ETYtORUxyStJUUUFmd3kakf3m/a
	EIqxiDjfgdOAdVMAMIpac1hkDcxTaA4dqOfYioVjQueguhAvxA/0SZwCmLA1rSauKM6O
	27JQ==
X-Gm-Message-State: AOAM5326xiEH3Ot5DcOaP7UBg1Ghzwjed28ICQKPsKX1oMBGg01yPvWA
	uloEgc7M3+zCECikLxqMy1Jyzq/4utN73Ygrvdxe7rmMbWh1hQ1SLoh9NA3hAZZhwAaEg1vXxLF
	p0K2HqOr9VT9oAjhuG/OR5v+/+tBcXUalNNfDNA==
X-Received: by 2002:a9d:2186:: with SMTP id s6mr13383603otb.58.1596456634861; 
	Mon, 03 Aug 2020 05:10:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUWYC4ZY+bPuoBG6o3jKDqGL1jEZseRxVi8YLb7bwNZVAyo56uncb4gvu1C+NnUONt6qGv5+NW6Cto9tJdawo=
X-Received: by 2002:a9d:2186:: with SMTP id s6mr13383590otb.58.1596456634670; 
	Mon, 03 Aug 2020 05:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200731212818.10782-1-efremov@linux.com>
	<777bd9d1-35b0-842a-83df-55792126c652@linux.com>
In-Reply-To: <777bd9d1-35b0-842a-83df-55792126c652@linux.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 3 Aug 2020 14:10:23 +0200
Message-ID: <CAHc6FU7VrzJ7wfTLsKZMjgkRiL7pTnwaLA4Jm4Wocm4hZwmrHQ@mail.gmail.com>
To: Denis Efremov <efremov@linux.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Use kvmalloc instead of opencoded
	kmalloc/vmalloc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

On Sat, Aug 1, 2020 at 2:05 PM Denis Efremov <efremov@linux.com> wrote:
> Please, skip this patch. I missed that kvmalloc checks (flags & GFP_KERNEL) == GFP_KERNEL
> before calling vmalloc.

okay. Assuming that you'll follow up with a fixed version, please also
mention that this change supplements commit 3cdcf63ed2d1 ("GFS2: use
kvfree() instead of open-coding it").

Thanks,
Andreas

