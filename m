Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id A6139197C4B
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 14:53:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585572823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y8qURCP64GyjtOUPinOpGzf7G0HXw/3MUDnw19/m01U=;
	b=FgXauHqaHjCQeGoOnoysPSkaoKIwQdpK05UL6PzYgvO9hseMa1ZqbJLDYzUjRInxbzni3P
	NrmPq7OdVUDEjSlrfXzPlP96tLMySQ3/l7AYiYCkj78s/F2lquV+6dXcZEHsSRTQFhIybF
	4kkJ9hJ5HD2D04lhaB9i2nmBVAjCU2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-wYGTD0tnNaq9dZouA3a1Ew-1; Mon, 30 Mar 2020 08:53:42 -0400
X-MC-Unique: wYGTD0tnNaq9dZouA3a1Ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6328D1412;
	Mon, 30 Mar 2020 12:53:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2888297AF5;
	Mon, 30 Mar 2020 12:53:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DADD944CA;
	Mon, 30 Mar 2020 12:53:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UCqYND017463 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 08:52:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B26F2166B2F; Mon, 30 Mar 2020 12:52:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 869F12166B30
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 12:52:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94A888FF66B
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 12:52:32 +0000 (UTC)
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
	[209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-V-iyz3PgNie8f4r7aFuhAA-1; Mon, 30 Mar 2020 08:52:30 -0400
X-MC-Unique: V-iyz3PgNie8f4r7aFuhAA-1
Received: by mail-ot1-f70.google.com with SMTP id d4so14727695oti.3
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 05:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y8qURCP64GyjtOUPinOpGzf7G0HXw/3MUDnw19/m01U=;
	b=ihW3JJ8+SE96r5+YFJrtKgQe/DG62pyQFvTlvXpEOhMF/lcPg8x4McgLqwW5Cc58sM
	tO5nPKfEdrbkOqeqZVanbv7GmvPvBeleSjnlpUN0+AMWsn+h9mgnT5TAAZzRtPdZ/dit
	AbBZx1KWDQ3sUzUgVcn9OlG9TJeQ0eB3f1WpY/1bR9kSkW60r1PIkOByQe82RH8AQWdP
	bDI2dJ91sr3cgqw2MxKH5A1ucqOV4EsCxxBPwHe3zIBL0AUM2pG5K2GUOORbmzNQ5sXL
	hAzZR1a/OE7B46iVqmsJ4Tjv9lbReyU0wBCvqaIGIghPWB3oLWza1+xvFKLx8nivJ326
	qO8w==
X-Gm-Message-State: ANhLgQ1LVNl9ZzSJxxo2QOA9giqaS3a9j43UG6LQY9GNpNDMypUfz7re
	QwNnQsFAsewen9A44dW+SaEsL4VR+IYAp9emkiDWenjvxHerJi2HKkBe/sjGlpcpIuuCX9Am7x0
	0qufiuuJMl5xyftcIFrI5RYspLB6T3qBAK7N32w==
X-Received: by 2002:aca:a883:: with SMTP id r125mr7124013oie.10.1585572749709; 
	Mon, 30 Mar 2020 05:52:29 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuSnJwJFDW86F5bMjwiYhfcBjrqWmbNyT0pGEC2LwVj/hDi089piMqrCS4nDKqL211hyHF0rmJlhCZn+mnjl0Y=
X-Received: by 2002:aca:a883:: with SMTP id r125mr7124005oie.10.1585572749456; 
	Mon, 30 Mar 2020 05:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <1831596904.19467951.1585572099993.JavaMail.zimbra@redhat.com>
	<1439057493.19467991.1585572122685.JavaMail.zimbra@redhat.com>
In-Reply-To: <1439057493.19467991.1585572122685.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 30 Mar 2020 14:52:18 +0200
Message-ID: <CAHc6FU7fndUNAy3fOE_NvqZAy-wqp3Dkcy_LoDtzR_A0NUfZGQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02UCqYND017463
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Fix oversight in
	gfs2_ail1_flush
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bob,

On Mon, Mar 30, 2020 at 2:42 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Under ordinary circumstances, function gfs2_ail1_start_one will start
> an item from the ail1 list writing, then return -EBUSY. This causes
> gfs2_ail1_flush to loop around and try again. However, it never
> clears the -EBUSY return code, so on rare occasions, like when the
> wbc runs out of nr_to_write, it can remain set, which triggers an
> error and withdraw.
>
> This patch resets the -EBUSY to 0 so this won't happen anymore.

this looks ok.

Thanks,
Andreas


