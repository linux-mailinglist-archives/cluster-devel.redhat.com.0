Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CA284EA296
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Oct 2019 18:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572456621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PfEuKQnMxOfNn7BfsnyZ5Wd3lq699E8qY7/wDP8z4Ks=;
	b=QJ6RLK1NseIcz6o32J4UhwFQDYU0QeG92magZWWGm9+skKWLbnPE89h685lpNezhW3Uwbr
	T/gSMYZ0g5yxPac1lOePC4/EBCcJu4i16n3BOVAX2SkyBSIp5Y0Sd0Xu3rnDnntk8QPzzg
	dSj9OiTExd2c0a3K7qw5fRRMMu067mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-c6bpsX06PlWq_JqlIS0J8Q-1; Wed, 30 Oct 2019 13:30:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBF4B800C61;
	Wed, 30 Oct 2019 17:30:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB48860870;
	Wed, 30 Oct 2019 17:30:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D7C44BB5C;
	Wed, 30 Oct 2019 17:30:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9UHUAVP023145 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Oct 2019 13:30:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18F7B1001B11; Wed, 30 Oct 2019 17:30:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 119551001B07
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 17:30:07 +0000 (UTC)
Received: from zimbra.alteeve.com (mail.alteeve.ca [65.39.153.71])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D695308FBF9
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 17:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.alteeve.com (Postfix) with ESMTP id A517FFB9
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 13:30:02 -0400 (EDT)
Received: from zimbra.alteeve.com ([127.0.0.1])
	by localhost (zimbra.alteeve.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8I6u5ktWaT1z for <cluster-devel@redhat.com>;
	Wed, 30 Oct 2019 13:30:00 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.alteeve.com (Postfix) with ESMTP id 08A36158C
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 13:30:00 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.alteeve.com 08A36158C
X-Virus-Scanned: amavisd-new at zimbra.alteeve.com
Received: from zimbra.alteeve.com ([127.0.0.1])
	by localhost (zimbra.alteeve.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Yigr8JrKnBB7 for <cluster-devel@redhat.com>;
	Wed, 30 Oct 2019 13:29:59 -0400 (EDT)
Received: from pulsar.alteeve.com (dhcp-108-168-20-237.cable.user.start.ca
	[108.168.20.237])
	by zimbra.alteeve.com (Postfix) with ESMTPSA id DAB6AFB9
	for <cluster-devel@redhat.com>; Wed, 30 Oct 2019 13:29:59 -0400 (EDT)
To: cluster-devel@redhat.com
From: Digimer <lists@alteeve.ca>
Message-ID: <f8efc895-19a0-c12e-7cfb-845d879a89d6@alteeve.ca>
Date: Wed, 30 Oct 2019 13:30:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 30 Oct 2019 17:30:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 30 Oct 2019 17:30:06 +0000 (UTC) for IP:'65.39.153.71'
	DOMAIN:'mail.alteeve.ca' HELO:'zimbra.alteeve.com'
	FROM:'lists@alteeve.ca' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_HELO_NONE,
	SPF_PASS) 65.39.153.71 mail.alteeve.ca 65.39.153.71 mail.alteeve.ca
	<lists@alteeve.ca>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9UHUAVP023145
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] Building clufter on EL8
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
X-MC-Unique: c6bpsX06PlWq_JqlIS0J8Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

  While waiting to see what CentOS 8 will do with regard to HA, I
decided to rebuild the rhel 8 packages for our own repo[1]. To this end,
I've rebuilt all packages, except clufter.

  The clufter package relies on jing, and jing is not provided in RHEL
8. Obviously, clufter was build for RHEL 8, so I'm curious how this was
done... I started the process of building jing myself, but very quickly
fell into a very deep dependency well.

Tips?

--=20
Digimer
Papers and Projects: https://alteeve.com/w/
"I am, somehow, less interested in the weight and convolutions of
Einstein=E2=80=99s brain than in the near certainty that people of equal ta=
lent
have lived and died in cotton fields and sweatshops." - Stephen Jay Gould

