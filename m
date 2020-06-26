Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 21BC920B710
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 19:31:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593192718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mtoAMY2XW89vhOBgxNqGdUMLTGPUvuzF40jBdbVwg24=;
	b=Fr5kyLnWgzKUHWxPSCc+/iosgXOVZHZaNHFMNs3r86bV3Mtc1Z0sOceq9yLDq/8vA+Jzlv
	w4+KOs9Y8OzTiH3XB8ryJ8QjfOdjN1XP4Sd1YDjKWMf4XmR/5slFN462xL6eId4/PWKIN/
	nIMjWXEtgsWXuMXUK3eWvk5J2Ql70zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-BS19KYxzOmGDRaNyXAsTMQ-1; Fri, 26 Jun 2020 13:31:56 -0400
X-MC-Unique: BS19KYxzOmGDRaNyXAsTMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4EA1107ACCA;
	Fri, 26 Jun 2020 17:31:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A526F60C80;
	Fri, 26 Jun 2020 17:31:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62909875B0;
	Fri, 26 Jun 2020 17:31:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QHVcr8019442 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 13:31:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E0F9101F0C7; Fri, 26 Jun 2020 17:31:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87B5910336F2
	for <cluster-devel@redhat.com>; Fri, 26 Jun 2020 17:31:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B416101A525
	for <cluster-devel@redhat.com>; Fri, 26 Jun 2020 17:31:35 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-365-x2Y1BOnlOm6MxWzbVhBEXw-1; Fri, 26 Jun 2020 13:31:33 -0400
X-MC-Unique: x2Y1BOnlOm6MxWzbVhBEXw-1
Received: by mail-io1-f70.google.com with SMTP id g17so6810579iob.3
	for <cluster-devel@redhat.com>; Fri, 26 Jun 2020 10:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mtoAMY2XW89vhOBgxNqGdUMLTGPUvuzF40jBdbVwg24=;
	b=pqT7mBY1ngmssBnCnm18D9eH7FMDnOR2jBI+9W6z6NSejLmXYj24PTV6/4u/lFVVBm
	V2J67K1LjebN7yb3BA1dEodfHmeufRPUK0MzXoM6te6934pKr1pYoYmh3DaCTR7oLjv8
	buNJtMyfWRaIogHE9fT75f+/voyleHtbpv2fz4S9ZqDjvuz9w6k5ogh46qKz5JmO33n/
	J1DZ/LMLe5KdlH67yQQ3FGtkFo1lrWz7hKT9bm3645oRWFnFmnpZi15Py7NRtrsZ6g36
	PQxsNf8I09PTxaLgFfUmxj1uAK/amIvByEB0UNgwOWVGKp+FAglFa9c9XgzB7qnPTdaX
	S4FQ==
X-Gm-Message-State: AOAM5310Bt6HnUpAg0LNRVCWnqzdWsDwFpgqqyiwcKwgxhk/s1Ntv5xY
	gsfI3TqKX3LRY7rTVnvJVpMwlu9a9TSpM4RbIEJ/oQCHAVnnp/u73l0pKFMV8GGqFdqXR7pnUhu
	Qt6ByIvukvSPsgMC6f2nM7yYde3ePuNvww7aCtQ==
X-Received: by 2002:a92:2802:: with SMTP id l2mr4063551ilf.169.1593192692858; 
	Fri, 26 Jun 2020 10:31:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztSdTGrLjmbOoGzDJ4Bdw7tV30WuF+J5ZrNtqwIfiytW0SqHTaYb1Vm7Rb4IY5lpWkdAScMS/3eQENhghGiPA=
X-Received: by 2002:a92:2802:: with SMTP id l2mr4063540ilf.169.1593192692672; 
	Fri, 26 Jun 2020 10:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200626172650.115224-1-aahringo@redhat.com>
	<20200626172650.115224-2-aahringo@redhat.com>
In-Reply-To: <20200626172650.115224-2-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Fri, 26 Jun 2020 13:31:21 -0400
Message-ID: <CAK-6q+g+f7BD+C5PKWWc+1Ybd1ruTwNGa7RfogEgr4AWdKtvwA@mail.gmail.com>
To: davem@davemloft.net
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kuba@kernel.org, netdev@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCHv2 dlm-next 1/3] net: sock: add
	sock_set_mark
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Dear netdev maintainers,

These patches are based on dlm/next. Due other changes in dlm/next
there could be a conflict when applying everything into net-next. Is
it okay to get this patch merged into dlm/next? Or what is the
preferred way to get these patches upstream?

Thank you.

- Alex

